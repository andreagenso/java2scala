module J2s.Parser where

import UU.Parsing
import J2s.Scanner
import J2s.Integration.ScannerParser
import UU.Scanner.Position

-- para importar syntax y semantics hechos a mano. (independientes del AG)
import J2s.Ast.Syntax  as AGS
import J2s.Ast.Semantic as AGS
-- para importar de AG
--import qualified AG.J2SAttrSem as AGS

-- 1
pJ2s =  AGS.sem_J2s_J2s <$> pPackageDeclaration <*> pImportDeclarations <*> pTypeDeclarations
-- -----------------------------------------------------------------------------------
-- Parser of PackageDeclaration - pAnnotations
-- ----------------------------------------------------------------------------------------
--  2 - OK
pPackageDeclaration = AGS.sem_PackageDeclaration_PackageDeclaration <$> pAnnotations <*  pKeyWord "package" <*> pPackageName <* pSpecialSimbol ";"
                   <|> pSucceed AGS.sem_PackageDeclaration_NilPackageDeclaration
-- 3                   
pAnnotations = pFoldr(AGS.sem_Annotations_Cons, AGS.sem_Annotations_Nil) pAnnotation

-- 4
pAnnotation = AGS.sem_Annotation_Annotation <$ pSpecialSimbol "@"<*> pTypeName <*> pTypeAnnotation

pTypeAnnotation = pSucceed AGS.sem_TypeAnnotation_MarkerAnnotation
                          <|> r <**> ( (\ss evp -> stan evp)  <$$> evps <|> (\ss ev -> stas ev) <$$> ev  )

r = pSpecialSimbol "("
stan = AGS.sem_TypeAnnotation_NormalAnnotation
stas = AGS.sem_TypeAnnotation_SingleElementAnnotation
evps  = pElementValuePairs  <* pSpecialSimbol ")"
ev =  pElementValue <* pSpecialSimbol ")" 

-- 6 OK
pTypeName = AGS.sem_TypeName_TypeName <$> pIdentifier <*> pTypeName'
pTypeName' = pSucceed AGS.sem_TypeName_NilTypeName
                  <|> AGS.sem_TypeName_TypeName <$ pSpecialSimbol "." <*> pIdentifier <*> pTypeName'

-- 7
pElementValuePairs = pFoldrSep(AGS.sem_ElementValuePairs_Cons, AGS.sem_ElementValuePairs_Nil) (pSpecialSimbol ",") pElementValuePair

-- 8 - OK                                                          
pElementValuePair = AGS.sem_ElementValuePair_ElementValuePair <$> pIdentifier <* pSpecialSimbol "=" <*> pElementValue                                               -- 9 - OK

pElementValue  = AGS.sem_ElementValue_ElementValueConditional <$> pConditionalExpression
                          <|> AGS.sem_ElementValue_ElementValueAnnotation <$> pAnnotation  -- siempre empieza con @
                          <|> AGS.sem_ElementValue_ElementValueEVArrayInitializer <$> pElementValueArrayInitializer -- siempre empieza con llave
                          
-- 10
pConditionalExpression = (\z fz -> fz z) <$> pConditionalOrExpression <*> pZ
pZ  =   (\e ce z -> AGS.sem_ConditionalExpression_ConditionalExprComb z e ce) <$ pOperator "?" <*> pExpression <* pOperator ":" <*> pConditionalExpression
   <|> pSucceed (\z -> AGS.sem_ConditionalExpression_ConditionalExpr z)

-- 11 ToDO INSTANCEOF
pConditionalOrExpression =  foldr pGen pFactor [ orExp, andExp, orIncl, orExcl, andSingle, eqs,rels, shift, adss, muls ]

pGen ops p  =  pChainl (foldr1 (<|>) (map f ops)) p
   where f (s,c)     = const c  <$> pOperator s

orExp  = [("||",AGS.sem_ConditionalOrExpression_Or)]
andExp = [("&&",AGS.sem_ConditionalOrExpression_And)]
orIncl = [("|",AGS.sem_ConditionalOrExpression_BitwiseOr)]
andSingle = [("&",AGS.sem_ConditionalOrExpression_BitwiseAnd)]
orExcl = [("^",AGS.sem_ConditionalOrExpression_BitwiseXor)]
eqs = [("==",AGS.sem_ConditionalOrExpression_EqualTo),("!=",AGS.sem_ConditionalOrExpression_NotEqualTo)]
rels = [("<",AGS.sem_ConditionalOrExpression_LessThan),("<=",AGS.sem_ConditionalOrExpression_LessThanOrEqualTo),(">=", AGS.sem_ConditionalOrExpression_GreaterThanOrEqualTo)]
--rels = [("<=",AGS.sem_ConditionalOrExpression_LessThanOrEqualTo),(">=", AGS.sem_ConditionalOrExpression_GreaterThanOrEqualTo)]
shift = [(">>>",AGS.sem_ConditionalOrExpression_ZeroFillRightShift),(">>",AGS.sem_ConditionalOrExpression_RightShift),("<<",AGS.sem_ConditionalOrExpression_LeftShift)]
adss = [("+", AGS.sem_ConditionalOrExpression_Add),("-", AGS.sem_ConditionalOrExpression_Sub)]
muls = [("*", AGS.sem_ConditionalOrExpression_Mult),("/",AGS.sem_ConditionalOrExpression_Div),("%",AGS.sem_ConditionalOrExpression_Mod),(">", AGS.sem_ConditionalOrExpression_GreaterThan)]

           
pFactor = (\pu f -> f pu) <$> pUnaryExpression <*> pFactor'

-- ToDO CONTROL DE CONTEXTO Y PRUEBAS
pFactor' = pSucceed (\u -> AGS.sem_ConditionalOrExpression_ConditionalOrExpressionUnaryExpression u)
           <|>  (\t u -> AGS.sem_ConditionalOrExpression_ConditionalOrExpressionIntanceOf u t) <$ pKeyWord "instanceof" <*>  pType

-- 21 - OK
pUnaryExpression = AGS.sem_UnaryExpression_UnaryExpressionPreIncrementExpression  <$ pOperator "++"  <*> pUnaryExpression   -- PreIncrement
                                <|> AGS.sem_UnaryExpression_UnaryExpressionPreDecrementExpression <$ pOperator "--"  <*> pUnaryExpression  -- PreDecrement
                                <|> AGS.sem_UnaryExpression_UnExpMas                              <$ pOperator "+" <*> pUnaryExpression
                                <|> AGS.sem_UnaryExpression_UnExpMenos                            <$ pOperator "-" <*> pUnaryExpression
                                <|> AGS.sem_UnaryExpression_Pestan                                <$ pOperator "~" <*> pUnaryExpression
                                <|> AGS.sem_UnaryExpression_Admiracion                            <$ pOperator "!" <*> pUnaryExpression
                                <|> pPrimary         <**> ( (AGS.sem_UnaryExpression_PostExpPrimaryPostfixZ <$$> pZPostfixExpression) <|> (pSucceed AGS.sem_UnaryExpression_PostfixExpressionPrimary))  -- PostfixExpression
                                
-- 24 - OK
-- ToDO CONDICION DE CONTEXTO PARA CAST

-- 25
-- Optimizado, aqui se refleja PostIncrementExpression y PostDecrementExpression
pZPostfixExpression     = pFoldr1 (AGS.sem_ZPostfixExpression_Cons,AGS.sem_ZPostfixExpression_Nil) pZPostfixExp
pZPostfixExp = AGS.sem_ZPostfixExp_PostIncrement <$ pOperator "++"
                        <|> AGS.sem_ZPostfixExp_PostDecrement <$ pOperator "--"
                                 
-- 26                   
pPrimary = pPrimaryNoNewArray <**> ( (pSucceed AGS.sem_Primary_PrimNoNewArray) <|> ( AGS.sem_Primary_PrimNoNewArrayZ <$$> pZPrimary))

-- *****************************************************************************
-- ZPrimary Optimizado ---------------------------------------------------------
-- *****************************************************************************
pZPrimary 
  =  pFoldr1(AGS.sem_ZPrimary_Cons, AGS.sem_ZPrimary_Nil) pPrimaryNNAArrayFieldAccessOrMethodInvocation
 
pPrimaryNNAArrayFieldAccessOrMethodInvocation 
  = pSpecialSimbol "." *> pPrimaryNNAArrayFieldAccessOrMethodInvocation'
pPrimaryNNAArrayFieldAccessOrMethodInvocation' = (\nw fcora -> fcora nw) <$> pNonWildTypeArguments <*> pPrimaryConstructorOrArrayMethod
                                              <|> AGS.sem_PrimaryNNAArrayFieldAccessOrMethodInvocation_PrimaryNoNewArrayFieldAccess <$> pIdentifier
 
pPrimaryConstructorOrArrayMethod = (\ i al nw -> AGS.sem_PrimaryNNAArrayFieldAccessOrMethodInvocation_PrimarynoNewArrayMethodInvocation nw i al ) <$> pIdentifier <* pSpecialSimbol "(" <*> pArgumentList <* pSpecialSimbol ")"
                                                            <|> pSucceed (\nw -> AGS.sem_PrimaryNNAArrayFieldAccessOrMethodInvocation_PrimaryConstructor nw)
-- *****************************************************************************
-- FIN - ZPrimary Optimizado ---------------------------------------------------
-- *****************************************************************************
                           
-- 27 - Optimizado
pPrimaryNoNewArray = AGS.sem_PrimaryNoNewArray_PrimaryNoNewArray <$> pPrimaryNNA <*> pZPrimaryNoNewArray

pPrimaryNNA =  AGS.sem_PrimaryNNA_PrimNNALiteral_IntegerLiteral_DecimalIntegerLiteral                 <$> pDecimalIntegerLiteral
                   <|> AGS.sem_PrimaryNNA_PrimNNALiteral_IntegerLiteral_HexIntegerLiteral                     <$> pHexIntegerLiteral
                   <|> AGS.sem_PrimaryNNA_PrimNNALiteral_IntegerLiteral_OctalIntegerLiteral                   <$> pOctalIntegerLiteral
                   <|> AGS.sem_PrimaryNNA_PrimNNALiteral_FloatingPointLiteral_DecimalFloatingPointLiteral     <$> pDecimalFloatingPointLiteral
                   <|> AGS.sem_PrimaryNNA_PrimNNALiteral_FloatingPointLiteral_HexadecimalFloatingPointLiteral <$> pHexadecimalFloatingPointLiteral
                   <|> AGS.sem_PrimaryNNA_PrimNNALiteral_BooleanLiteral                                       <$> pBooleanLiteral "true"
                   <|> AGS.sem_PrimaryNNA_PrimNNALiteral_BooleanLiteral                                       <$> pBooleanLiteral "false"
                   <|> AGS.sem_PrimaryNNA_PrimNNALiteral_CharacterLiteral                                     <$> pCharacterLiteral
                   <|> AGS.sem_PrimaryNNA_PrimNNALiteral_StringLiteral                                        <$> pStringLiteral
                   <|> AGS.sem_PrimaryNNA_PrimNNALiteral_NullLiteral                                          <$ pNullLiteral "null"
                   <|> AGS.sem_PrimaryNNA_PrimNNAVoid                                                             <$ pKeyWord "void" <* pSpecialSimbol "." <* pKeyWord "class"
                   <|> AGS.sem_PrimaryNNA_PrimNNAThis                                                             <$ pKeyWord "this"
                   <|> (\f -> f)                                                                          <$ pSpecialSimbol "(" <*> pParExprOrCastExpression               
                   <|> (\f -> f)                                                                          <$ pKeyWord "super" <* pSpecialSimbol "." <*> pPrimaryNNAiV
                   <|>  AGS.sem_PrimaryNNA_PrimNNATypeClassPrimitiveType                                      <$> pPrimitiveType <*> pTypeZ  <* pPrimaryNNA_PrimNNATypeClassPrimitiveType_Class
                   <|> (\ids f -> f ids)                                                                  <$> pTypeName <*> pPrimaryNNAv
                   <|> (\i f -> f i)                                                                      <$> pIdentifier <*> pPrimaryNNA'
                   <|> (\f -> f)                                                                          <$ pKeyWord "new" *> pArrayCreationExpressionOrClassInstanceCreationExpression

pPrimaryNNA_PrimNNATypeClassPrimitiveType_Class = pSucceed (\f -> f)
    <|> (\f -> f) <$ pSpecialSimbol "." <* pKeyWord "class"


                   
-- ToDO PRUEBAS PARA VERIFICAR LA AFECTACION DE pClassOrInterfaceType
pArrayCreationExpressionOrClassInstanceCreationExpression =  pPrimitiveType <**>  (( AGS.sem_PrimaryNNA_ArrayCreationExpressionPrimitiveType <$$> pDimExprs ) <|> ( (\ a b c -> AGS.sem_PrimaryNNA_ArrayCreationExpressionArrInitialPrim c b a) <$$> pDims <*> pArrayInitializer ))
                                                <|>  pClassOrInterfaceType <**> (( AGS.sem_PrimaryNNA_ArrayCreationExpressionClassOrInterf <$$> pDimExprs ) <|> ( (\a b c -> AGS.sem_PrimaryNNA_ArrayCreationExpressionArrInitialClass c b a) <$$>  pDims <*> pArrayInitializer))
                                                <|>  AGS.sem_PrimaryNNA_PrimNNAClassInstanceCreationExpression <$> pTypeArguments <*> pClassOrInterfaceType <* pSpecialSimbol "(" <*>  pArgumentList <* pSpecialSimbol ")" -- Antes -> <$> pClassInstanceCreationExpression
                                                                                                
-- Type.class se desglosa en varios                
-- ToDO CONDICIONES DE CONTEXTO EL CASO CAST
pParExprOrCastExpression = (\e f -> f e)  <$>  pExpression <* pSpecialSimbol ")" <*> pParExprOrCastExpression'
                   
pParExprOrCastExpression' =  pSucceed (\e -> AGS.sem_PrimaryNNA_PrimNNAParExp e)
                                             <|> (\u e ->  AGS.sem_PrimaryNNA_UnNotPlusCastExpression e u)  <$>  pUnaryExpression -- AQUI CONTROLAR CONDICIONES DE CONTEXTO PARA CAST

pPrimaryNNA' =   (\t i -> AGS.sem_PrimaryNNA_PrimNNATypeClassReferenceTypeTypeVariable i t)  <$>  pTypeZ   <* pSpecialSimbol "." <* pKeyWord "class"
                   <|>   (\a p i -> AGS.sem_PrimaryNNA_PrimNNATypeClassReferenceTypeClassIOT i a p ) <$>  pTypeArguments <*> pPrimNNAClassOrInterfaceType  -- .class esta a continuacion

pPrimaryNNA''' =  (\n i a e -> AGS.sem_PrimaryNNA_PrimNNAMethodInvocationClassN e n i a )  <$> pNonWildTypeArguments <*> pIdentifier <* pSpecialSimbol "(" <*> pArgumentList <* pSpecialSimbol ")"
                      <|> (\i e -> AGS.sem_PrimaryNNA_PrimNNAFieldAccessClassName e i )            <$> pIdentifier
                   
pPrimaryNNAiV = AGS.sem_PrimaryNNA_PrimNNAMethodInvocationSuper <$>  pNonWildTypeArguments <*> pIdentifier <* pSpecialSimbol "(" <*> pArgumentList <* pSpecialSimbol ")"
                   <|> AGS.sem_PrimaryNNA_PrimNNAFieldAccessSuper       <$>  pIdentifier
                   
pPrimaryNNAv  =  (\a ids -> AGS.sem_PrimaryNNA_PrimNNAMethodInvocationMN ids a)  <$ pSpecialSimbol "(" <*> pArgumentList <* pSpecialSimbol ")"
                 <|> (\ e ids -> AGS.sem_PrimaryNNA_PrimNNAArrayAccessExprName ids e)    <$ pSpecialSimbol "[" <*> pExpression <* pSpecialSimbol "]"
                 <|> pSucceed (\ids -> AGS.sem_PrimaryNNA_PostfixExpressionExpressionName ids) -- AQUI APLICAR COND CONTEXTO
                 <|> (\f -> f)                                                       <$ pSpecialSimbol "." <*> pPrimaryNNAv'
                 
pPrimaryNNAv' = (\nwt i al tn -> AGS.sem_PrimaryNNA_PrimNNAMethodInvocationTypeN tn nwt i al) <$>  pNonWildTypeArguments1 <*> pIdentifier <* pSpecialSimbol "(" <*> pArgumentList <* pSpecialSimbol ")"
                     <|> (\i  -> AGS.sem_PrimaryNNA_PrimNNAClassName i )  <$ pKeyWord "this"                             -- AQUI CONTROLAR QUE LA COND DE CONTEXTO ADMITA UN SOLO ID DE TYPENAME
                     <|>  (\f ->  f)                                  <$ pKeyWord "super" <* pSpecialSimbol "." <*> pPrimaryNNA''' -- -- AQUI CONTROLAR QUE LA COND DE CONTEXTO ADMITA UN SOLO ID DE TYPENAME

--               <|> (\ zpe ids -> AGS.sem_PrimaryNNA_PostExpNamePostfixZ ids zpe) <$> pZPostfixExpression -- AQUI APLICAR COND CONTEXTO

pPrimNNAClassOrInterfaceType  = (\f -> f) <$ pSpecialSimbol "." <*> pPrimNNAClassOrInterfaceType'
                                <|> AGS.sem_PrimNNAClassOrInterfaceType_TypeZPrimNNAClassOrInterfaceType        <$> pTypeZ <* pSpecialSimbol "." <* pKeyWord "class"
pPrimNNAClassOrInterfaceType'  = (\i ta co ->  AGS.sem_PrimNNAClassOrInterfaceType_PrimNNAClassOrInterfaceType i ta co ) <$> pIdentifier <*> pTypeArguments <*> pPrimNNAClassOrInterfaceType
                                        <|> (AGS.sem_PrimNNAClassOrInterfaceType_NilPrimNNAClassOrInterfaceType)           <$ pKeyWord "class"

pZPrimaryNoNewArray = pFoldr(AGS.sem_ZPrimaryNoNewArray_Cons, AGS.sem_ZPrimaryNoNewArray_Nil) pZPrimaryOrExpression
pZPrimaryOrExpression = AGS.sem_ZPrimaryOrExpression_ZPOEExpressionDeArrayAccess <$ pSpecialSimbol "[" <*> pExpression <* pSpecialSimbol "]"
                                         <|> AGS.sem_ZPrimaryOrExpression_ZPOEZPrimary <$> pZPrimary
                                         
-- 28 -  OK
pType =  AGS.sem_Type_TypePrimitiveType <$> pPrimitiveOrRefereceType <*> pTypeZ

pPrimitiveOrRefereceType =  AGS.sem_PrimitiveOrReferenceType_TypePrimitivePrimitivetypeBoolean  <$ pKeyWord "boolean"
                          <|> AGS.sem_PrimitiveOrReferenceType_TypePrimitiveNumericType_TypeIntegral_Byte   <$ pKeyWord "byte"
                          <|> AGS.sem_PrimitiveOrReferenceType_TypePrimitiveNumericType_TypeIntegral_Short  <$ pKeyWord "short"
                          <|> AGS.sem_PrimitiveOrReferenceType_TypePrimitiveNumericType_TypeIntegral_Int    <$ pKeyWord "int"
                          <|> AGS.sem_PrimitiveOrReferenceType_TypePrimitiveNumericType_TypeIntegral_Long   <$ pKeyWord "long"
                          <|> AGS.sem_PrimitiveOrReferenceType_TypePrimitiveNumericType_TypeIntegral_Char   <$ pKeyWord "char"
                          <|> AGS.sem_PrimitiveOrReferenceType_TypePrimitiveNumericType_TypeFloating_Float  <$ pKeyWord "float"
                          <|> AGS.sem_PrimitiveOrReferenceType_TypePrimitiveNumericType_TypeFloating_Double <$ pKeyWord "double"
                          <|> AGS.sem_PrimitiveOrReferenceType_TypeReference <$> pReferenceType

pTypeZ = pFoldr (AGS.sem_TypeZ_Cons, AGS.sem_TypeZ_Nil) pArrayType
pArrayType = AGS.sem_ArrayType_ArrayType <$ pSpecialSimbol "[" <* pSpecialSimbol "]"
         
-- OK
pPrimitiveType =  AGS.sem_PrimitiveType_PrimitivetypeBoolean            <$ pKeyWord "boolean"
                          <|> AGS.sem_PrimitiveType_NumericType_TypeIntegral_Byte   <$ pKeyWord "byte"
                          <|> AGS.sem_PrimitiveType_NumericType_TypeIntegral_Short  <$ pKeyWord "short"
                          <|> AGS.sem_PrimitiveType_NumericType_TypeIntegral_Int    <$ pKeyWord "int"
                          <|> AGS.sem_PrimitiveType_NumericType_TypeIntegral_Long   <$ pKeyWord "long"
                          <|> AGS.sem_PrimitiveType_NumericType_TypeIntegral_Char   <$ pKeyWord "char"
                          <|> AGS.sem_PrimitiveType_NumericType_TypeFloating_Float  <$ pKeyWord "float"
                          <|> AGS.sem_PrimitiveType_NumericType_TypeFloating_Double <$ pKeyWord "double"

-- OK
pReferenceType  = AGS.sem_ReferenceType_ReferenceTypeClassOrInterfaceType <$> pIdentifier <*> pTypeArguments <*> pZClassOrInterfaceType

pClassOrInterfaceType = AGS.sem_ClassOrInterfaceType_ClassOrInterfaceType <$>   pIdentifier <*> pTypeArguments <*> pZClassOrInterfaceType

pZClassOrInterfaceType     = pFoldr(AGS.sem_ZClassOrInterfaceType_Cons,AGS.sem_ZClassOrInterfaceType_Nil) pZCOITTypeDeclSpecifier
pZCOITTypeDeclSpecifier    = AGS.sem_ZCOITTypeDeclSpecifier_ZCOITTypeDeclSpecifier <$ pSpecialSimbol "." <*> pIdentifier <*> pTypeArguments
                                         
-- OK                             
pTypeArguments = (\al f -> f al) <$ pOperator "<" <*> pActualTypeArgumentList <*> pTypeArguments'
                          <|> pSucceed AGS.sem_TypeArguments_NilTypeArguments

pTypeArguments' =  (\al -> AGS.sem_TypeArguments_TypeArgumentsC1 al) <$ pOperator ">"

pActualTypeArgumentList = pFoldr1Sep (AGS.sem_ActualTypeArgumentList_Cons,AGS.sem_ActualTypeArgumentList_Nil) (pSpecialSimbol ",") pActualTypeArgument

-- OK                                           
pActualTypeArgument = AGS.sem_ActualTypeArgument_ActualTypeArgumentWildCard <$ pOperator "?" <*> pWildcardBounds
                                   <|> AGS.sem_ActualTypeArgument_ActualTypeReferenceType   <$> pType -- <* pSpecialSimbol "[" <*pSpecialSimbol "]"

pWildcardBounds  =  AGS.sem_WildcardBounds_WilcardBoundsExtendsReferenceType <$ pKeyWord "extends" <*>  pType
                <|>  AGS.sem_WildcardBounds_WilcardBoundsSuperReferenceType <$ pKeyWord "super"  <*>  pType
                <|> pSucceed AGS.sem_WildcardBounds_NilwildcardBounds
 
pExpression =  (\ce f -> f ce) <$> pConditionalOrExpression <*> pExpression'
pExpression' = (\e ce z -> AGS.sem_Expression_ExpressionConditionalExprComb z e ce) <$ pOperator "?" <*> pExpression <* pOperator ":" <*> pConditionalExpression
                        <|> (\op e z -> AGS.sem_Expression_ExpressionAssignment z op e)         <$> pAssignmentOperator <*> pExpression
                    <|> pSucceed (\ce -> AGS.sem_Expression_ExpressionConditionalExpr ce)
                   
pAssignmentOperator = AGS.sem_AssignmentOperator_AssignmentOp                  <$ pSpecialSimbol "="
                                   <|> AGS.sem_AssignmentOperator_AssignmentPlus               <$ pOperator "*="
                                   <|> AGS.sem_AssignmentOperator_AssignmentDiv                <$ pOperator "/="
                                   <|> AGS.sem_AssignmentOperator_AssignmentMod                <$ pOperator "%="
                                   <|> AGS.sem_AssignmentOperator_AssignmentAdd                <$ pOperator "+="
                                   <|> AGS.sem_AssignmentOperator_AssignmentMin                <$ pOperator "-="
                                   <|> AGS.sem_AssignmentOperator_AssignmentMinShifShift       <$ pOperator "<<="
                                   <|> AGS.sem_AssignmentOperator_AssignmentMayShitfShift      <$ pOperator ">>="
                                   <|> AGS.sem_AssignmentOperator_AssignmentMayShiftShiftShift <$ pOperator ">>>="
                                   <|> AGS.sem_AssignmentOperator_AssignmentAndSingle          <$ pOperator "&="
                                   <|> AGS.sem_AssignmentOperator_AssignmentCincun             <$ pOperator "^="
                                   <|> AGS.sem_AssignmentOperator_AssignmentOrSingle           <$ pOperator "|="
                                                   

-- AQUI AL MENOS 1
pArgumentList = pFoldrSep (AGS.sem_ArgumentList_Cons, AGS.sem_ArgumentList_Nil) (pSpecialSimbol ",") pExpression
                         

pNonWildTypeArguments = (\tl f -> f tl ) <$ pOperator "<" <*> pReferenceTypeList <*> pNonWildTypeArguments'
                                          <|> pSucceed AGS.sem_NonWildTypeArguments_NilNonWildTypeArguments

pNonWildTypeArguments' =  (\tl -> AGS.sem_NonWildTypeArguments_NonWildTypeArgumentsC3 tl) <$ pOperator ">>>"
                                          <|> (\tl -> AGS.sem_NonWildTypeArguments_NonWildTypeArgumentsC2 tl) <$ pOperator ">>"
                                          <|> (\tl -> AGS.sem_NonWildTypeArguments_NonWildTypeArgumentsC1 tl)  <$ pOperator ">"

pNonWildTypeArguments1 = (\tl f -> f tl) <$ pOperator "<" <*> pReferenceTypeList <*> pNonWildTypeArguments1'

pNonWildTypeArguments1' = (\ tl -> AGS.sem_NonWildTypeArguments_NonWildTypeArgumentsC3 tl) <$ pOperator ">>>"
                                          <|> (\ tl -> AGS.sem_NonWildTypeArguments_NonWildTypeArgumentsC2 tl) <$ pOperator ">>"
                                          <|>  (\ tl -> AGS.sem_NonWildTypeArguments_NonWildTypeArgumentsC1 tl) <$ pOperator ">"
--                                        <|>  pSucceed (\ tl -> AGS.sem_NonWildTypeArguments_NonWildTypeArgumentsC0 tl)
-- OJO OPTIMIZAR ESTO
pReferenceTypeList = pFoldr1Sep (AGS.sem_ReferenceTypeList_Cons,AGS.sem_ReferenceTypeList_Nil) (pSpecialSimbol ",") pType


pDimExprs = AGS.sem_DimExprs_DimExprs <$ pSpecialSimbol "[" <*> pExpression <* pSpecialSimbol "]" <*> pDimExprs
             <|> AGS.sem_DimExprs_NilDimExprsDims <$> pDims
             <|> pSucceed AGS.sem_DimExprs_NilDimExprs
         
pDims  =  (AGS.sem_Dims_Cons ()) <$ pSpecialSimbol "[" <* pSpecialSimbol "]" <*> pDims'
pDims' =  (AGS.sem_Dims_Cons ()) <$ pSpecialSimbol "[" <* pSpecialSimbol "]" <*> pDims'
     <|> pSucceed AGS.sem_Dims_Nil

pArrayInitializer = AGS.sem_ArrayInitializer_ArrayInitializer <$ pSpecialSimbol "{" <*> pVariableInitializers <* pSpecialSimbol "}"

pVariableInitializers = pFoldrSep (AGS.sem_VariableInitializers_Cons,AGS.sem_VariableInitializers_Nil) (pSpecialSimbol ",") pVariableInitializer
                                          
pVariableInitializer = AGS.sem_VariableInitializer_VariableInitializerExp <$> pExpression
                                        <|> AGS.sem_VariableInitializer_VariableInitializerArr <$> pArrayInitializer
                                                   
pElementValueArrayInitializer = AGS.sem_ElementValueArrayInitializer_ElementValueArrayInitializer <$ pSpecialSimbol "{" <*>  pElementValues <* pSpecialSimbol "}"

pElementValues = pFoldrSep(AGS.sem_ElementValues_Cons,AGS.sem_ElementValues_Nil) (pSpecialSimbol ",") pElementValue

pPackageName = pFoldr1Sep(AGS.sem_PackageName_Cons,AGS.sem_PackageName_Nil) (pSpecialSimbol ".") pIdentifier

-- ----------------------------------------------------------------------------------------
-- FIN Parser of PackageDeclaration - pAnnotations
-- ----------------------------------------------------------------------------------------

-- ----------------------------------------------------------------------------------------              
-- Parser of ImportDeclarations
-- ----------------------------------------------------------------------------------------
-- 77
pImportDeclarations =   AGS.sem_ImportDeclarations_ImportDeclarations <$ pKeyWord "import" <*> pImportDeclaration  <*> pImportDeclarations
                                   <|> pSucceed AGS.sem_ImportDeclarations_NilImportDeclarations

-- 78
pImportDeclaration = AGS.sem_ImportDeclaration_SingleTypeImportDeclaration <$> pTypeName <* pSpecialSimbol ";"
                                  <|> AGS.sem_ImportDeclaration_TypeImportOnDemandDeclaration <$> pPackageOrTypeName <* pSpecialSimbol "." <* pOperator "*" <* pSpecialSimbol ";"
                                  <|> pKeyWord "static" *> pTypeName <**> (( (\tn ss -> AGS.sem_ImportDeclaration_SingleStaticImportDeclaration tn) <$$> pSpecialSimbol ";" ) <|> ( (\tn ss -> AGS.sem_ImportDeclaration_StaticImportOnDemandDeclaration tn ) <$$> pSpecialSimbol "." <* pOperator "*" <* pSpecialSimbol ";" ) )

-- 81
pPackageOrTypeName = AGS.sem_PackageOrTypeName_PackageOrTypeName <$> pIdentifier <*> pPackageOrTypeName'
pPackageOrTypeName' = AGS.sem_PackageOrTypeName_PackageOrTypeName <$ pSpecialSimbol "." <*> pIdentifier <*> pPackageOrTypeName'
                                   <|> pSucceed AGS.sem_PackageOrTypeName_NilPackageOrTypeName

-- ----------------------------------------------------------------------------------------------                                        
-- FIN Parser of ImportDeclarations
-- ----------------------------------------------------------------------------------------------

-- ----------------------------------------------------------------------------------------------                                        
-- INICIO Parser of TypeDeclarations
-- ----------------------------------------------------------------------------------------------
-- 84
pTypeDeclarations = pFoldr (AGS.sem_TypeDeclarations_Cons,AGS.sem_TypeDeclarations_Nil)pTypeDeclaration
                                 
pTypeDeclaration = (\cm f -> f cm) <$> pModifiers <*> pTypeDeclaration'
                                <|> AGS.sem_TypeDeclaration_TypeDeclarationSemiColon <$ pSpecialSimbol ";"
pTypeDeclaration' =   (\a b c d e f    -> AGS.sem_TypeDeclaration_TypeDeclarationClassDeclarationNormalCD f a b c d e)              <$ pKeyWord "class" <*> pIdentifier <*> pTypeParameters <*> pSuper <*> pInterfaces <* pSpecialSimbol "{" <*> pClassBodyDeclarations <* pSpecialSimbol "}"
                                  <|> (\a b c f        -> AGS.sem_TypeDeclaration_TypeDeclarationClassDeclarationEnumD f a b c)                     <$ pKeyWord "enum" <*> pIdentifier <*> pInterfaces <*> pEnumBody
                                  <|> (\i l f          -> AGS.sem_TypeDeclaration_TypeDeclarationInterfaceDeclarationAnnotationTypeD f i l )        <$ pSpecialSimbol "@" <* pKeyWord "interface" <*> pIdentifier <* pSpecialSimbol "{" <*> (pFoldr (AGS.sem_ListAnnotationTypeElementDeclaration_Cons,AGS.sem_ListAnnotationTypeElementDeclaration_Nil) pAnnotationTypeElementDeclaration) <* pSpecialSimbol "}"
                                  <|> (\i tp e  imd f  -> AGS.sem_TypeDeclaration_TypeDeclarationInterfaceDeclarationNormalInterfaceD f i tp e imd )<$ pKeyWord "interface" <*> pIdentifier <*> pTypeParameters <*> pExtendsInterfaces <* pSpecialSimbol "{" <*> pFoldr (AGS.sem_ListInterfaceMemberDeclaration_Cons,AGS.sem_ListInterfaceMemberDeclaration_Nil) pInterfaceMemberDeclaration <* pSpecialSimbol "}"
                                  
-- NO CAMBIAR A pList
pModifiers = AGS.sem_Modifiers_Modifiers <$> pModifier <*> pModifiers
                           <|> pSucceed AGS.sem_Modifiers_NilModifiers

pModifier =  AGS.sem_Modifier_ModifierPublic    <$ pKeyWord "public"
                 <|> AGS.sem_Modifier_ModifierProtected <$ pKeyWord "protected"
                 <|> AGS.sem_Modifier_ModifierPrivate   <$ pKeyWord "private"
                 <|> AGS.sem_Modifier_ModifierAbstract  <$ pKeyWord "abstract"
                 <|> AGS.sem_Modifier_ModifiersStatic   <$ pKeyWord "static"
                 <|> AGS.sem_Modifier_ModifierFinal     <$ pKeyWord "final"
                 <|> AGS.sem_Modifier_ModifierStrictfp  <$ pKeyWord "strictfp"
                 <|> AGS.sem_Modifier_FieldModifierVolatile  <$ pKeyWord "volatile"
                 <|> AGS.sem_Modifier_FieldModifierTransient  <$ pKeyWord "transient"
                 <|> AGS.sem_Modifier_MethodModifierSynchronized <$ pKeyWord "synchronized"
                 <|> AGS.sem_Modifier_MethodModifierNative <$ pKeyWord "native"
                 <|> AGS.sem_Modifier_ModifierAnnotation <$> pAnnotation

pTypeParameters = (\pl f -> f pl) <$ pOperator "<" <*>  pTypeParameterList <*> pTypeParameters'
                           <|> pSucceed AGS.sem_TypeParameters_NilTypeParameters

pTypeParameters' = (\ pl  -> AGS.sem_TypeParameters_TypeParametersC3 pl ) <$ pOperator ">>>"
                           <|> (\ pl  -> AGS.sem_TypeParameters_TypeParametersC2 pl ) <$ pOperator ">>"
                           <|> (\ pl  -> AGS.sem_TypeParameters_TypeParametersC1 pl ) <$ pOperator ">"

pTypeParameterList = pFoldr1Sep (AGS.sem_TypeParameterList_Cons, AGS.sem_TypeParameterList_Nil) (pSpecialSimbol ",")  pTypeParameter
                          
pTypeParameter = (\tv ftv -> ftv tv) <$> pIdentifier <*> pZTypeBound
pZTypeBound =  (\tb tv -> AGS.sem_TypeParameter_TypeParameterBound tv tb)<$>  pTypeBound
                        <|> pSucceed (\ftp -> AGS.sem_TypeParameter_TypeParameter ftp)

pTypeBound = AGS.sem_TypeBound_TypeBound <$ pKeyWord "extends" <*> pClassOrInterfaceType <*> pAdditionalBoundList
pAdditionalBoundList = AGS.sem_TypeBound_TypeBound <$ pOperator "&" <*> pClassOrInterfaceType <*> pAdditionalBoundList
                                        <|> pSucceed AGS.sem_TypeBound_NilAdditionalBoundList
                                        
pSuper = AGS.sem_Super_Super <$ pKeyWord "extends" <*> pClassOrInterfaceType
      <|> pSucceed AGS.sem_Super_NilSuper
      
pInterfaces = AGS.sem_Interfaces_Interfaces <$ pKeyWord "implements" <*> pInterfaceTypeList
                   <|> pSucceed AGS.sem_Interfaces_NilInterfaces
                   
pInterfaceTypeList = pFoldr1Sep (AGS.sem_InterfaceTypeList_Cons,AGS.sem_InterfaceTypeList_Nil) (pSpecialSimbol ",") pClassOrInterfaceType
                                   
pClassBodyDeclarations = pFoldr (AGS.sem_ClassBodyDeclarations_Cons, AGS.sem_ClassBodyDeclarations_Nil) pClassBodyDeclaration
                                          
pClassBodyDeclaration =  AGS.sem_ClassBodyDeclaration_ClassBodyDeclClassMemberDeclSemiColon <$ pSpecialSimbol ";"
                                         <|> AGS.sem_ClassBodyDeclaration_ClassBodyInstanceInitializer          <$ pSpecialSimbol "{" <*> pBlockStatements <* pSpecialSimbol "}"  -- pBlock -- pInstanceInitializer
                                         <|> AGS.sem_ClassBodyDeclaration_ClassBodyStaticInitializer            <$ pKeyWord "static" <* pSpecialSimbol "{" <*> pBlockStatements <* pSpecialSimbol "}"  -- pBlock -- pStaticInitializer
                                         <|> (\cm f -> f cm)                                                <$> pModifiers <*> pClassMemberDeclaration'

pClassMemberDeclaration' =   (\a b c d e f    -> AGS.sem_ClassBodyDeclaration_ClassBodyDeclClassMemberDeclClassDeclarationNormalCD f a b c d e)        <$ pKeyWord "class" <*> pIdentifier <*> pTypeParameters <*> pSuper <*> pInterfaces <* pSpecialSimbol "{" <*> pClassBodyDeclarations <* pSpecialSimbol "}"
                                  <|> (\a b c f        -> AGS.sem_ClassBodyDeclaration_ClassBodyDeclClassMemberDeclClassDeclarationEnumD f a b c)                      <$ pKeyWord "enum" <*> pIdentifier <*> pInterfaces <*> pEnumBody
                                  <|> (\i l f          -> AGS.sem_ClassBodyDeclaration_ClassBodyDeclClassMemberDeclInterfaceDeclarationAnnotationTypeD f i l )         <$ pSpecialSimbol "@" <* pKeyWord "interface" <*> pIdentifier <* pSpecialSimbol "{" <*> (pFoldr (AGS.sem_ListAnnotationTypeElementDeclaration_Cons,AGS.sem_ListAnnotationTypeElementDeclaration_Nil) pAnnotationTypeElementDeclaration) <* pSpecialSimbol "}"
                                  <|> (\i tp e  imd f  -> AGS.sem_ClassBodyDeclaration_ClassBodyDeclClassMemberDeclInterfaceDeclarationNormalInterfaceD f i tp e imd ) <$ pKeyWord "interface" <*> pIdentifier <*> pTypeParameters <*> pExtendsInterfaces <* pSpecialSimbol "{" <*> pFoldr (AGS.sem_ListInterfaceMemberDeclaration_Cons,AGS.sem_ListInterfaceMemberDeclaration_Nil) pInterfaceMemberDeclaration <* pSpecialSimbol "}"
                                  <|> (\t vd f -> AGS.sem_ClassBodyDeclaration_ClassBodyDeclClassMemberDeclFieldDeclaration f t vd)                                    <$> pType <*> pVariableDeclarators <* pSpecialSimbol  ";"
                                  <|> (\tp f -> f tp)                                                                                                              <$> pTypeParameters <*> pClassMemberDeclarationConstructorOrMethod

pClassMemberDeclarationConstructorOrMethod = (\rt md t mb tp m ->  AGS.sem_ClassBodyDeclaration_ClassBodyDeclClassMemberDeclMethodDeclaration m tp rt md t mb) <$> pResultType <*> pMethodDeclarator <*> pThrows <*> pMethodBody
                                                                                  <|> (\i f -> f i) <$> pIdentifier <* pSpecialSimbol "(" <*> pZConstructorDeclarator
                                                                                  
pZConstructorDeclarator =  (\   t cb  i tp m -> AGS.sem_ClassBodyDeclaration_ClassBodyConstructorDeclarationNoFormalParList m tp i t cb) <$ pSpecialSimbol ")" <*> pThrows <*> pConstructorBody
                                           <|> (\fp t cb  i tp m -> AGS.sem_ClassBodyDeclaration_ClassBodyConstructorDeclaration m tp i fp t cb )            <$> pFormalParameterList <* pSpecialSimbol ")" <*> pThrows <*> pConstructorBody
                                                                                  
pVariableDeclarators = pFoldr1Sep (AGS.sem_VariableDeclarators_Cons, AGS.sem_VariableDeclarators_Nil) (pSpecialSimbol ",") pVariableDeclarator
                                        
pVariableDeclarator = (\vdi fvdi -> fvdi vdi) <$> pVariableDeclaratorId <*> pZVariableDeclarator
pZVariableDeclarator = (\vi vdi -> AGS.sem_VariableDeclarator_VariableDeclaratorIdAsig vdi vi) <$ pSpecialSimbol "=" <*> pVariableInitializer
                    <|> pSucceed (\vdi -> AGS.sem_VariableDeclarator_VariableDeclaratorId vdi)
pVariableDeclaratorId   = (\i fvd -> fvd i) <$> pIdentifier <*> pZVariableDeclaratorIdZ
pZVariableDeclaratorIdZ = (\vd i -> AGS.sem_VariableDeclaratorId_VarDeclaratorIdVDZ i vd) <$> pVariableDeclaratorIdZ
                       <|> pSucceed (\i -> AGS.sem_VariableDeclaratorId_VarDeclaratorId i)
pVariableDeclaratorIdZ   = (\fvd -> fvd)  <$ pSpecialSimbol "[" <* pSpecialSimbol "]" <*> pVariableDeclaratorIdZFi
pVariableDeclaratorIdZFi = (\vd -> AGS.sem_VariableDeclaratorIdZ_VarDeclaratorIdZ vd)  <$> pVariableDeclaratorIdZ
                                            <|> pSucceed (AGS.sem_VariableDeclaratorIdZ_VarDeclaratorIdCorchete)
                                          
pResultType = AGS.sem_ResultType_ResultTypeVoid <$ pKeyWord "void"
                   <|> AGS.sem_ResultType_ResultTypeType <$> pType

pMethodDeclarator  =  AGS.sem_MethodDeclarator_MethodDeclaratorFormalPL <$> pIdentifier <* pSpecialSimbol "(" <*> pFormalParameterList <* pSpecialSimbol ")"

pFormalParameterList = (\vm t f -> f vm t ) <$> pVariableModifiers <*> pType <*> pFormalParameterList'
                                        <|> pSucceed AGS.sem_FormalParameterList_FormalParameterListNil
pFormalParameterList' = (\vdi vm t ->  AGS.sem_FormalParameterList_FormalParameterListLast vm t vdi)          <$ pSpecialSimbol "." <* pSpecialSimbol "." <* pSpecialSimbol "." <*> pVariableDeclaratorId
                                        <|> (\vdi fpl vm t -> AGS.sem_FormalParameterList_FormalParameterListFormal vm t vdi fpl) <$> pVariableDeclaratorId <*> pFormalParameterList''

pFormalParameterList'' =  (\f -> f) <$ pSpecialSimbol "," <*> pFormalParameterList
                                          <|> pSucceed AGS.sem_FormalParameterList_FormalParameterListNil
                                        
-- debe haber al menos 1 -> NO
pVariableModifiers = AGS.sem_VariableModifiers_VariableModifiers <$> pVariableModifier <*> pVariableModifiers
                                   <|> pSucceed AGS.sem_VariableModifiers_NilVariableModifiers

pVariableModifier = AGS.sem_VariableModifier_VariableModifierFinal <$ pKeyWord "final"
                                 <|> AGS.sem_VariableModifier_VariableModifierAnnotation <$> pAnnotation
                                 
pThrows = AGS.sem_Throws_Throws <$ pKeyWord "throws" <*> pExceptionTypeList
           <|> pSucceed AGS.sem_Throws_NilThrows
           
pExceptionTypeList = pFoldr1Sep (AGS.sem_ExceptionTypeList_Cons, AGS.sem_ExceptionTypeList_Nil) (pSpecialSimbol ",") pExceptionType
                                   
pExceptionType =  AGS.sem_ExceptionType_ExceptionTypeTypeVariable <$> pIdentifier
                          <|> AGS.sem_ExceptionType_ExceptionTypeClassType <$> pClassOrInterfaceType
                          
pMethodBody = AGS.sem_MethodBody_MethodBodyBlock       <$ pSpecialSimbol "{" <*> pBlockStatements <* pSpecialSimbol "}" -- pBlock
                    <|> AGS.sem_MethodBody_MethodBodySemiColon <$ pSpecialSimbol ";"
                    
pBlockStatements = pFoldr (AGS.sem_BlockStatements_Cons,AGS.sem_BlockStatements_Nil) pBlockStatement
-- para el caso de que debe haber al menos 1                            
pBlockStatements' = pFoldr1 (AGS.sem_BlockStatements_Cons,AGS.sem_BlockStatements_Nil) pBlockStatement
                                
pBlockStatement =  (\cm f -> f cm)                                                   <$> pModifiers <*> pBlockStatement'        
                           <|> AGS.sem_BlockStatement_BlockStatementStatement                        <$> pStatement

pBlockStatement' =  (\a b c d e f   -> AGS.sem_BlockStatement_BlockStatementClassDeclarationNormalClassDeclaration f a b c d e)  <$ pKeyWord "class" <*> pIdentifier <*> pTypeParameters <*> pSuper <*> pInterfaces <* pSpecialSimbol "{" <*> pClassBodyDeclarations <* pSpecialSimbol "}"
                                <|> (\a b c f       -> AGS.sem_BlockStatement_BlockStatementClassDeclarationEnumDeclaration f a b c)             <$ pKeyWord "enum" <*> pIdentifier <*> pInterfaces <*> pEnumBody
                                <|> (\t vd f        -> AGS.sem_BlockStatement_BlockStatementLocalVariableDeclarationStatement f t vd )          <$>  pType <*> pVariableDeclarators <* pSpecialSimbol ";"

pStatement =  AGS.sem_Statement_StatementLabeled                     <$> pIdentifier <* pOperator ":" <*> pStatementNested  -- LabeledStatement
                  <|> (\e s f -> f e s)                              <$ pKeyWord "if" <* pSpecialSimbol "(" <*> pExpression <* pSpecialSimbol ")" <*> pStatementNested <*> pElse
                  <|> AGS.sem_Statement_StatementWhile               <$ pKeyWord "while" <* pSpecialSimbol "(" <*> pExpression <* pSpecialSimbol ")" <*> pStatementNested  -- pWhileStatement
                  <|> AGS.sem_Statement_SWTSBlock                    <$ pSpecialSimbol "{" <*> pBlockStatements <* pSpecialSimbol "}" -- pBlock
                  <|> AGS.sem_Statement_SWTSEmptyStatement           <$ pSpecialSimbol ";"
                  <|> (\e f -> f e)                                  <$ pKeyWord "assert" <*> pExpression <*> pZAssertStatement
                  <|> AGS.sem_Statement_SWTSSwitchStatement          <$ pKeyWord "switch" <* pSpecialSimbol "(" <*> pExpression <* pSpecialSimbol ")" <*> pSwitchBlock
                  <|> AGS.sem_Statement_SWTSDoStatement              <$ pKeyWord "do" <*> pStatementNested <* pKeyWord "while" <* pSpecialSimbol "(" <*> pExpression <* pSpecialSimbol ")" <* pSpecialSimbol ";"
                  <|> (\fb -> fb)                                    <$ pKeyWord "break" <*> pZBreakStatement
                  <|> (\f -> f)                                      <$ pKeyWord "continue" <*> pZContinueStatement
                  <|> (\f -> f)                                      <$ pKeyWord "return" <*> pZReturnStatement
                  <|> AGS.sem_Statement_SWTSynchronizedStatement     <$ pKeyWord "synchronized" <* pSpecialSimbol "(" <*> pExpression <* pSpecialSimbol ")" <* pSpecialSimbol "{" <*> pBlockStatements <* pSpecialSimbol "}"  -- pBlock
                  <|> AGS.sem_Statement_SWTTrhowStatement            <$ pKeyWord "throw" <*> pExpression <* pSpecialSimbol ";"
                  <|> (\b fts -> fts b )                             <$ pKeyWord "try" <* pSpecialSimbol "{" <*> pBlockStatements <* pSpecialSimbol "}"  <*> pZTryStatement
                  <|> AGS.sem_Statement_StatementFor                 <$> pForStatement
                  <|> AGS.sem_Statement_SWTSExpressionStatement      <$> pExpressionAssignment <*  pSpecialSimbol ";"

pStatementNested =  AGS.sem_StatementNested_StatementLabeledNested                       <$> pIdentifier <* pOperator ":" <*> pStatementNested  -- LabeledStatement
                  <|> (\e s f -> f e s)                                                  <$ pKeyWord "if" <* pSpecialSimbol "(" <*> pExpression <* pSpecialSimbol ")" <*> pStatementNested <*> pElseNested
                  <|> AGS.sem_StatementNested_StatementWhileNested                       <$ pKeyWord "while" <* pSpecialSimbol "(" <*> pExpression <* pSpecialSimbol ")" <*> pStatementNested  -- pWhileStatement
                  <|> AGS.sem_StatementNested_SWTSBlockNested                            <$ pSpecialSimbol "{" <*> pBlockStatements <* pSpecialSimbol "}" -- pBlock
                  <|> AGS.sem_StatementNested_SWTSEmptyStatementNested                   <$ pSpecialSimbol ";"
                  <|> (\e f -> f e)                                                      <$ pKeyWord "assert" <*> pExpression <*> pZAssertStatementNested
                  <|> AGS.sem_StatementNested_SWTSSwitchStatementNested                  <$ pKeyWord "switch" <* pSpecialSimbol "(" <*> pExpression <* pSpecialSimbol ")" <*> pSwitchBlock
                  <|> AGS.sem_StatementNested_SWTSDoStatementNested                      <$ pKeyWord "do" <*> pStatementNested <* pKeyWord "while" <* pSpecialSimbol "(" <*> pExpression <* pSpecialSimbol ")" <* pSpecialSimbol ";"
                  <|> (\fb -> fb)                                                        <$ pKeyWord "break" <*> pZBreakStatementNested
                  <|> (\f -> f)                                                          <$ pKeyWord "continue" <*> pZContinueStatementNested
                  <|> (\f -> f)                                                          <$ pKeyWord "return" <*> pZReturnStatementNested
                  <|> AGS.sem_StatementNested_SWTSynchronizedStatementNested             <$ pKeyWord "synchronized" <* pSpecialSimbol "(" <*> pExpression <* pSpecialSimbol ")" <* pSpecialSimbol "{" <*> pBlockStatements <* pSpecialSimbol "}"  -- pBlock
                  <|> AGS.sem_StatementNested_SWTTrhowStatementNested                    <$ pKeyWord "throw" <*> pExpression <* pSpecialSimbol ";"
                  <|> (\b fts -> fts b )                                                 <$ pKeyWord "try" <* pSpecialSimbol "{" <*> pBlockStatements <* pSpecialSimbol "}"  <*> pZTryStatementNested
                  <|> AGS.sem_StatementNested_StatementForNested                         <$> pForStatement
                  <|> AGS.sem_StatementNested_SWTSExpressionStatementNested              <$> pExpression <*  pSpecialSimbol ";"


pExpressionAssignment =  (\ce f -> f ce) <$> pUnaryExpression <*> pExpressionAssignment'
pExpressionAssignment' = (\e ce z -> AGS.sem_ExpressionAssignment_ExpressionAssignment2 z e ce) <$ pOperator "?" <*> pExpression <* pOperator ":" <*> pConditionalExpression
                        <|> (\op e z -> AGS.sem_ExpressionAssignment_ExpressionAssignment3 z op e)         <$> pAssignmentOperator <*> pExpression
                        <|> pSucceed (\ce -> AGS.sem_ExpressionAssignment_ExpressionAssignment1 ce)


pElse = pSucceed  AGS.sem_Statement_StatementIf             -- IfThenStatement
         <|> (\selse e sthen ->   AGS.sem_Statement_StatementIfElse e sthen selse) <$ pKeyWord "else" <*> pStatementNested   -- pIfThenElseStatement
                  
pZAssertStatement = (\ ce e -> AGS.sem_Statement_SWTSAssertStatementCondEx e ce) <$  pOperator ":" <*> pConditionalExpression <* pSpecialSimbol ";"
                                <|> (\e     -> AGS.sem_Statement_SWTSAssertStatementCond e )     <$  pSpecialSimbol ";"
                                
pZContinueStatement = (\i -> AGS.sem_Statement_SWTSContinueStatement i ) <$> pIdentifier <* pSpecialSimbol ";"
                                  <|> AGS.sem_Statement_SWTSNilContinueStatement <$ pSpecialSimbol ";"


pElseNested = pSucceed  AGS.sem_StatementNested_StatementIfNested             -- IfThenStatement
       <|> (\selse e sthen ->   AGS.sem_StatementNested_StatementIfElseNested e sthen selse) <$ pKeyWord "else" <*> pStatementNested   -- pIfThenElseStatement

pZAssertStatementNested = (\ ce e -> AGS.sem_StatementNested_SWTSAssertStatementCondExNested e ce) <$  pOperator ":" <*> pConditionalExpression <* pSpecialSimbol ";"
                              <|> (\e     -> AGS.sem_StatementNested_SWTSAssertStatementCondNested e )     <$  pSpecialSimbol ";"

pZContinueStatementNested = (\i -> AGS.sem_StatementNested_SWTSContinueStatementNested i ) <$> pIdentifier <* pSpecialSimbol ";"
                                <|> AGS.sem_StatementNested_SWTSNilContinueStatementNested <$ pSpecialSimbol ";"

pZTryStatement =  (\l b -> AGS.sem_Statement_SWTTryStatement b l) <$> pCatchClauses1
              <|> (\l f b -> AGS.sem_Statement_SWTTryStatementFinally b l f) <$> pCatchClauses <* pKeyWord "finally" <* pSpecialSimbol "{" <*> pBlockStatements <* pSpecialSimbol "}"  -- pBlock

pZTryStatementNested =  (\l b -> AGS.sem_StatementNested_SWTTryStatementNested b l) <$> pCatchClauses1
              <|> (\l f b -> AGS.sem_StatementNested_SWTTryStatementFinallyNested b l f) <$> pCatchClauses <* pKeyWord "finally" <* pSpecialSimbol "{" <*> pBlockStatements <* pSpecialSimbol "}"  -- pBlock

-- AST
--pCatchClauses1 = pList1 pCatchClause
--pCatchClauses = pList pCatchClause
pCatchClauses1 = pFoldr1 (AGS.sem_Catches_Cons, AGS.sem_Catches_Nil) pCatchClause
pCatchClauses = pFoldr(AGS.sem_Catches_Cons, AGS.sem_Catches_Nil) pCatchClause

pZReturnStatement  = (\e -> AGS.sem_Statement_SWTSReturnStatement e)    <$> pExpression <* pSpecialSimbol ";"
                                 <|> AGS.sem_Statement_SWTSNilReturnStatement <$ pSpecialSimbol ";"

pZReturnStatementNested  = (\e -> AGS.sem_StatementNested_SWTSReturnStatementNested e)    <$> pExpression <* pSpecialSimbol ";"
                                 <|> AGS.sem_StatementNested_SWTSNilReturnStatementNested <$ pSpecialSimbol ";"


-- revisar orden, optimizar
pSwitchBlock  = (\fs -> fs)<$ pSpecialSimbol "{" <*> pZSwitchBlock
pZSwitchBlock = (\ls fs -> fs ls)                            <$> pFoldr1 (AGS.sem_SwitchBlockStatementGroups_Cons, AGS.sem_SwitchBlockStatementGroups_Nil) pSwitchBlockStatementGroup <*> pZZSwitchBlock
             <|> (\l -> AGS.sem_SwitchBlock_SwitchBlockLabels l) <$> pFoldr1 (AGS.sem_SwitchLabels_Cons,AGS.sem_SwitchLabels_Nil) pSwitchLabel <* pSpecialSimbol "}"
             <|> (AGS.sem_SwitchBlock_NilSwitchBlock)            <$ pSpecialSimbol "}"
pZZSwitchBlock = (\ll ls -> AGS.sem_SwitchBlock_SwitchBlockAll ls ll ) <$> pFoldr1 (AGS.sem_SwitchLabels_Cons,AGS.sem_SwitchLabels_Nil) pSwitchLabel <* pSpecialSimbol "}"
              <|> (\l -> AGS.sem_SwitchBlock_SwitchBlockGroups l)      <$ pSpecialSimbol "}"

pSwitchBlockStatementGroup = AGS.sem_SwitchBlockStatementGroup_SwitchBlockStatementGroup <$> pFoldr1 (AGS.sem_SwitchLabels_Cons,AGS.sem_SwitchLabels_Nil) pSwitchLabel <*> pBlockStatements'
                    
pSwitchLabel =  (\fsl -> fsl) <$ pKeyWord "case" <*> pZSwitchLabel
                    <|> AGS.sem_SwitchLabel_SwitchLabelDefault <$ pKeyWord "default" <* pOperator ":"
pZSwitchLabel = (\e -> AGS.sem_SwitchLabel_SwitchLabelConstant e) <$> pExpression <* pOperator ":"
             <|> (\i -> AGS.sem_SwitchLabel_SwitchLabelEnum i)    <$> pIdentifier <* pOperator ":"
                    
pZBreakStatement = (AGS.sem_Statement_SWTSBreakStatement) <$  pSpecialSimbol ";"
                <|> (\i -> AGS.sem_Statement_SWTSBreakStatementId i) <$> pIdentifier <* pSpecialSimbol ";"

pZBreakStatementNested = (AGS.sem_StatementNested_SWTSBreakStatementNested) <$  pSpecialSimbol ";"
                <|> (\i -> AGS.sem_StatementNested_SWTSBreakStatementIdNested i) <$> pIdentifier <* pSpecialSimbol ";"

                           
pForInit = AGS.sem_ForInit_ForInitStaExp <$> pStatementExpressionList
        <|> AGS.sem_ForInit_ForInitLocalVar <$> pVariableModifiers <*> pType <*> pVariableDeclarators -- <* pSpecialSimbol ";" --pLocalVariableDeclaration
        <|> pSucceed AGS.sem_ForInit_NilForInit
        
pStatementExpressionList = AGS.sem_StatementExpressionList_StatementExpressionList <$> pExpression <*> pStatementExpressionList'
pStatementExpressionList' = AGS.sem_StatementExpressionList_StatementExpressionList <$ pSpecialSimbol "," <*> pExpression <*> pStatementExpressionList'
                                                <|> pSucceed AGS.sem_StatementExpressionList_NilStatementExpressionList
                                                                                                
pForUpdate = AGS.sem_ForUpdate_ForUpdate <$> pStatementExpressionList
                  <|> pSucceed AGS.sem_ForUpdate_NilForUpdate

pForStatement = (\ffs -> ffs) <$ pKeyWord "for" <* pSpecialSimbol "(" <*> pZForStatement
pZForStatement = (\fi f -> f fi)                                             <$> pForInit <* pSpecialSimbol ";" <*> pZBasicForStatement
                         <|> AGS.sem_ForStatement_ForStatementEnhancedForStatement           <$> pVariableModifiers <*> pType <*> pIdentifier <* pOperator ":" <*> pExpression <* pSpecialSimbol ")" <*> pStatement
                         <|> AGS.sem_ForStatement_ForStatementEnhancedForStatementNoVarModif <$> pType <*> pIdentifier <* pOperator ":" <*> pExpression <* pSpecialSimbol ")" <*> pStatement

pZBasicForStatement = (\e fu s fi  -> AGS.sem_ForStatement_ForStatementBasicForStatementAll fi e fu s) <$> pExpression <* pSpecialSimbol ";" <*> pForUpdate <* pSpecialSimbol ")" <*> pStatement
                                  <|> (\fu s fi -> AGS.sem_ForStatement_ForStatementBasicForStatementNoExp fi fu s)    <$ pSpecialSimbol ";" <*> pForUpdate <* pSpecialSimbol ")" <*> pStatement
                                  
pExtendsInterfaces = AGS.sem_ExtendsInterfaces_ExtendsInterfaceType <$ pKeyWord "extends" <*> pClassOrInterfaceType <*> pExtendsInterfaces'
                                  <|> pSucceed AGS.sem_ExtendsInterfaces_NilExtendsInterfaces
pExtendsInterfaces' = AGS.sem_ExtendsInterfaces_ExtendsInterfaceType <$ pSpecialSimbol "," <*> pClassOrInterfaceType <*> pExtendsInterfaces'
                                  <|> pSucceed AGS.sem_ExtendsInterfaces_NilExtendsInterfaces

pInterfaceMemberDeclaration = (\cm f -> f cm) <$> pModifiers <*> pInterfaceMemberDeclaration'
                                <|> AGS.sem_InterfaceMemberDeclaration_InterfaceMemberDeclTypeDeclarationSemiColon <$ pSpecialSimbol ";"
pInterfaceMemberDeclaration' =   (\a b c d e f    -> AGS.sem_InterfaceMemberDeclaration_InterfaceMemberDeclTypeDeclarationClassDeclarationNormalCD f a b c d e)   <$ pKeyWord "class" <*> pIdentifier <*> pTypeParameters <*> pSuper <*> pInterfaces <* pSpecialSimbol "{" <*> pClassBodyDeclarations <* pSpecialSimbol "}"
                                  <|> (\a b c f        -> AGS.sem_InterfaceMemberDeclaration_InterfaceMemberDeclTypeDeclarationClassDeclarationEnumD f a b c)                     <$ pKeyWord "enum" <*> pIdentifier <*> pInterfaces <*> pEnumBody
                                  <|> (\i l f          -> AGS.sem_InterfaceMemberDeclaration_InterfaceMemberDeclTypeDeclarationInterfaceDeclarationAnnotationTypeD f i l )        <$ pSpecialSimbol "@" <* pKeyWord "interface" <*> pIdentifier <* pSpecialSimbol "{" <*> (pFoldr (AGS.sem_ListAnnotationTypeElementDeclaration_Cons,AGS.sem_ListAnnotationTypeElementDeclaration_Nil) pAnnotationTypeElementDeclaration) <* pSpecialSimbol "}"
                                  <|> (\i tp e  imd f  -> AGS.sem_InterfaceMemberDeclaration_InterfaceMemberDeclTypeDeclarationInterfaceDeclarationNormalInterfaceD f i tp e imd )<$ pKeyWord "interface" <*> pIdentifier <*> pTypeParameters <*> pExtendsInterfaces <* pSpecialSimbol "{" <*> pFoldr (AGS.sem_ListInterfaceMemberDeclaration_Cons,AGS.sem_ListInterfaceMemberDeclaration_Nil) pInterfaceMemberDeclaration <* pSpecialSimbol "}"
                                  <|> (\t vd f         -> AGS.sem_InterfaceMemberDeclaration_InterfaceMemberDeclarationConstant f t vd)                                           <$> pType <*> pVariableDeclarators <* pSpecialSimbol ";"
                                  <|> (\tp rt d t f    -> AGS.sem_InterfaceMemberDeclaration_InterfaceMemberDeclarationAbstract f tp rt d t)                                      <$> pTypeParameters <*> pResultType <*> pMethodDeclarator <*> pThrows

pAnnotationTypeElementDeclaration = (\cm f -> f cm) <$> pModifiers <*> pAnnotationTypeElementDeclaration'
                                <|> AGS.sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclTypeDeclarationSemiColon <$ pSpecialSimbol ";"
                                
pAnnotationTypeElementDeclaration' =   (\a b c d e f    -> AGS.sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclTypeDeclarationClassDeclarationNormalCD f a b c d e) <$ pKeyWord "class" <*> pIdentifier <*> pTypeParameters <*> pSuper <*> pInterfaces <* pSpecialSimbol "{" <*> pClassBodyDeclarations <* pSpecialSimbol "}"
                                  <|> (\a b c f        -> AGS.sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclTypeDeclarationClassDeclarationEnumD f a b c)                         <$ pKeyWord "enum" <*> pIdentifier <*> pInterfaces <*> pEnumBody
                                  <|> (\i l f          -> AGS.sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclTypeDeclarationInterfaceDeclarationAnnotationTypeD f i l )            <$ pSpecialSimbol "@" <* pKeyWord "interface" <*> pIdentifier <* pSpecialSimbol "{" <*> (pFoldr (AGS.sem_ListAnnotationTypeElementDeclaration_Cons,AGS.sem_ListAnnotationTypeElementDeclaration_Nil) pAnnotationTypeElementDeclaration) <* pSpecialSimbol "}"
                                  <|> (\i tp e  imd f  -> AGS.sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclTypeDeclarationInterfaceDeclarationNormalInterfaceD f i tp e imd )    <$ pKeyWord "interface" <*> pIdentifier <*> pTypeParameters <*> pExtendsInterfaces <* pSpecialSimbol "{" <*> pFoldr (AGS.sem_ListInterfaceMemberDeclaration_Cons,AGS.sem_ListInterfaceMemberDeclaration_Nil) pInterfaceMemberDeclaration <* pSpecialSimbol "}"
                                  <|> (\t f        ->  f t)                                                                                                                         <$> pType <*> pAnnotationTypeElementDeclaration''
                                  
pAnnotationTypeElementDeclaration''= (\vd t f          -> AGS.sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclConstant f t vd)                                      <$> pVariableDeclarators <* pSpecialSimbol ";"
                                                 <|> (\i d t f         -> AGS.sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclAbstract f t i d)                                     <$> pIdentifier <* pSpecialSimbol "(" <* pSpecialSimbol ")" <*> pDefaultValue <* pSpecialSimbol ";"

pDefaultValue = AGS.sem_DefaultValue_DefaultValue <$ pKeyWord "default" <*> pElementValue
                         <|> pSucceed AGS.sem_DefaultValue_NilDefaultValue
                         
pEnumBody = (\ec feb -> feb ec)  <$ pSpecialSimbol "{" <*>  pEnumConstants <*> pZEnumBody        
pZEnumBody = (\ed ec -> AGS.sem_EnumBody_EnumBody ec ed ) <$ pSpecialSimbol "," <*> pEnumBodyDeclarations <* pSpecialSimbol "}"
                 <|> (\ed ec -> AGS.sem_EnumBody_EnumBody ec ed ) <$> pEnumBodyDeclarations <* pSpecialSimbol "}"

-- Se queda tal cual por problemas de comas
pEnumConstants = AGS.sem_EnumConstants_EnumConstants <$>  pEnumConstant <*> pEnumConstants'
                         <|> pSucceed AGS.sem_EnumConstants_NilEnumConstants  -- Debe existir caso Succeed
pEnumConstants' = AGS.sem_EnumConstants_EnumConstants <$ pSpecialSimbol "," <*> pEnumConstant <*> pEnumConstants'
                           <|> pSucceed AGS.sem_EnumConstants_NilEnumConstants
                           
pEnumConstant = (\a i f -> f a i ) <$> pAnnotations <*> pIdentifier <*> pZEnumConstant
pZEnumConstant = (\al fec a i  -> fec a i al) <$ pSpecialSimbol "(" <*> pArgumentList <* pSpecialSimbol ")" <*> pZZEnumConstant
                        <|> (\cb  a i -> AGS.sem_EnumConstant_EnumConstantClasB a i cb) <$ pSpecialSimbol "{" <*> pClassBodyDeclarations <* pSpecialSimbol "}"
                        <|> pSucceed (\i -> AGS.sem_EnumConstant_EnumConstantNothing i)
pZZEnumConstant = (\cl al  a i -> AGS.sem_EnumConstant_EnumConstantAll  al a i cl) <$ pSpecialSimbol "{" <*> pClassBodyDeclarations <* pSpecialSimbol "}"
                           <|> pSucceed (\al a i -> AGS.sem_EnumConstant_EnumConstantArgL al a i)

pEnumBodyDeclarations = AGS.sem_EnumBodyDeclarations_EnumBodyDeclarations <$ pSpecialSimbol ";" <*> pClassBodyDeclarations
                                         <|> pSucceed AGS.sem_EnumBodyDeclarations_NilEnumBodyDeclarations

pConstructorBody = AGS.sem_ConstructorBody_ConstructorBody <$ pSpecialSimbol "{" <*> pExplicitConstructorInvocation <*> pBlockStatements <* pSpecialSimbol "}"

pExplicitConstructorInvocation = (\nw f -> f  nw)   <$> pNonWildTypeArguments <*> pZExplicitConstructorInvocation
                                                          <|> AGS.sem_ExplicitConstructorInvocation_ExplConsInvPrimary <$> pPrimary <* pKeyWord "super" <* pSpecialSimbol "(" <*> pArgumentList <* pSpecialSimbol ")" <* pSpecialSimbol ";"
                                                          <|> pSucceed AGS.sem_ExplicitConstructorInvocation_NilExplixitConsInv
                                                          
pZExplicitConstructorInvocation = (\ al nw -> AGS.sem_ExplicitConstructorInvocation_ExplConsInvThis nw al )  <$ pKeyWord "this" <* pSpecialSimbol "(" <*> pArgumentList <* pSpecialSimbol ")" <* pSpecialSimbol ";"
                                                          <|> (\ al nw -> AGS.sem_ExplicitConstructorInvocation_ExplConsInvSuper nw al) <$ pKeyWord "super" <* pSpecialSimbol "(" <*> pArgumentList <* pSpecialSimbol ")" <* pSpecialSimbol ";"
                                                          
pCatchClause = AGS.sem_CatchClause_CatchClause <$ pKeyWord "catch" <* pSpecialSimbol "(" <*> pVariableModifiers <*> pType <*> pVariableDeclaratorId <* pSpecialSimbol ")" <* pSpecialSimbol "{" <*> pBlockStatements <* pSpecialSimbol "}"  -- pBlock

-- --------------------------------------------------------------------------------------------                  
-- FIN Parser of TypeDeclarations
-- ---------------------------------------------------------------------------------------------
parser nombre = do 
                   entrada   <- readFile nombre
                   let sel   = classify (initPos nombre) entrada
                   resultado <- parseIO pJ2s sel
                   putStrLn( show resultado)
