module J2s.Ast.Semantic where

import J2s.Ast.Syntax

sem_J2s_J2s = J2s

sem_PackageDeclaration_PackageDeclaration = PackageDeclaration
sem_PackageDeclaration_NilPackageDeclaration =  NilPackageDeclaration
                         
-- -------------------------------------------------------------------
-- definicion de Annotations
-- ------------------------------------------------------------------
sem_Annotation_Annotation = Annotation
sem_TypeAnnotation_MarkerAnnotation        = MarkerAnnotation
sem_TypeAnnotation_NormalAnnotation        = NormalAnnotation  -- ElementValuePairs
sem_TypeAnnotation_SingleElementAnnotation = SingleElementAnnotation  -- ElementValue
                                 
sem_TypeName_TypeName    = TypeName
sem_TypeName_NilTypeName = NilTypeName
                           
sem_ElementValuePair_ElementValuePair = ElementValuePair

sem_ElementValue_ElementValueConditional        = ElementValueConditional
sem_ElementValue_ElementValueAnnotation         = ElementValueAnnotation
sem_ElementValue_ElementValueEVArrayInitializer = ElementValueEVArrayInitializer
                                                                                           
sem_ConditionalExpression_ConditionalExpr = ConditionalExpr -- ConditionalOrExpression
sem_ConditionalExpression_ConditionalExprComb = ConditionalExprComb -- ConditionalOrExpression Expression ConditionalExpression
                                                        
sem_ConditionalOrExpression_Or                        = (:||:)
sem_ConditionalOrExpression_And                       = (:&&:)
sem_ConditionalOrExpression_BitwiseOr                      = (:|:)
sem_ConditionalOrExpression_BitwiseXor                     = (:^:)
sem_ConditionalOrExpression_BitwiseAnd                     = (:&:)

sem_ConditionalOrExpression_EqualTo                        = (:==:)
sem_ConditionalOrExpression_NotEqualTo                      = (:!=:)

sem_ConditionalOrExpression_LessThan  = (:<:)
sem_ConditionalOrExpression_GreaterThan  = (:>:)
sem_ConditionalOrExpression_LessThanOrEqualTo = (:<=:)
sem_ConditionalOrExpression_GreaterThanOrEqualTo = (:>=:)
sem_ConditionalOrExpression_LeftShift  = (:<<:)
sem_ConditionalOrExpression_RightShift  = (:>>:)
sem_ConditionalOrExpression_ZeroFillRightShift = (:>>>:)
sem_ConditionalOrExpression_Add  = (:+:)
sem_ConditionalOrExpression_Sub  = (:-:)
sem_ConditionalOrExpression_Mult  = (:*:)
sem_ConditionalOrExpression_Div  = (:/:) --
sem_ConditionalOrExpression_Mod  = (:%:) --

sem_ConditionalOrExpression_ConditionalOrExpressionUnaryExpression = ConditionalOrExpressionUnaryExpression
sem_ConditionalOrExpression_ConditionalOrExpressionIntanceOf = ConditionalOrExpressionIntanceOf

sem_UnaryExpression_UnaryExpressionPreIncrementExpression = UnaryExpressionPreIncrementExpression
sem_UnaryExpression_UnaryExpressionPreDecrementExpression = UnaryExpressionPreDecrementExpression
sem_UnaryExpression_UnExpMas                                              = UnExpMas
sem_UnaryExpression_UnExpMenos                                                = UnExpMenos
-- sem_UnaryExpression_UnNotPlus                             = UnNotPlus
sem_UnaryExpression_Pestan                                = Pestan
sem_UnaryExpression_Admiracion                            = Admiracion
sem_UnaryExpression_UnNotPlusCastExpression               = UnNotPlusCastExpression
sem_UnaryExpression_PostExpPrimaryPostfixZ                = PostExpPrimaryPostfixZ
sem_UnaryExpression_PostfixExpressionPrimary              = PostfixExpressionPrimary


sem_Primary_PrimNoNewArray               = PrimNoNewArray
sem_Primary_PrimNoNewArrayZ              = PrimNoNewArrayZ

sem_PrimaryNoNewArray_PrimaryNoNewArray     = PrimaryNoNewArray

sem_ReferenceType_ReferenceTypeClassOrInterfaceType = ReferenceTypeClassOrInterfaceType

                                          
sem_TypeArguments_TypeArgumentsC1 = TypeArgumentsC1
sem_TypeArguments_NilTypeArguments = NilTypeArguments
                                        
sem_ActualTypeArgument_ActualTypeArgumentWildCard = ActualTypeArgumentWildCard
sem_ActualTypeArgument_ActualTypeReferenceType    = ActualTypeReferenceType

sem_WildcardBounds_WilcardBoundsExtendsReferenceType = WilcardBoundsExtendsReferenceType
sem_WildcardBounds_WilcardBoundsSuperReferenceType   = WilcardBoundsSuperReferenceType
sem_WildcardBounds_NilwildcardBounds                 = NilwildcardBounds                                        


sem_Expression_ExpressionConditionalExpr     = ExpressionConditionalExpr 
sem_Expression_ExpressionConditionalExprComb = ExpressionConditionalExprComb 
sem_Expression_ExpressionAssignment                      = ExpressionAssignment

sem_ExpressionAssignment_ExpressionAssignment1 = ExpressionAssignment1
sem_ExpressionAssignment_ExpressionAssignment2 = ExpressionAssignment2
sem_ExpressionAssignment_ExpressionAssignment3 = ExpressionAssignment3
                                
sem_AssignmentOperator_AssignmentOp = AssignmentOp
sem_AssignmentOperator_AssignmentPlus = AssignmentPlus -- *=
sem_AssignmentOperator_AssignmentDiv = AssignmentDiv -- /=
sem_AssignmentOperator_AssignmentMod = AssignmentMod -- %=
sem_AssignmentOperator_AssignmentAdd = AssignmentAdd -- +=
sem_AssignmentOperator_AssignmentMin = AssignmentMin -- -=
sem_AssignmentOperator_AssignmentMinShifShift = AssignmentMinShifShift  -- <<=
sem_AssignmentOperator_AssignmentMayShitfShift = AssignmentMayShitfShift -- >>=
sem_AssignmentOperator_AssignmentMayShiftShiftShift = AssignmentMayShiftShiftShift -- >>>=
sem_AssignmentOperator_AssignmentAndSingle = AssignmentAndSingle -- &=
sem_AssignmentOperator_AssignmentCincun = AssignmentCincun -- ^=
sem_AssignmentOperator_AssignmentOrSingle = AssignmentOrSingle -- |=  

sem_FieldAccess_FieldAccessPrim = FieldAccessPrim
sem_FieldAccess_FieldAccessSuper = FieldAccessSuper
sem_FieldAccess_FieldAccessClassName = FieldAccessClassName
                                 
sem_ArrayAccess_ArrayAccessExpName = ArrayAccessExpName
sem_ArrayAccess_ArrayAccessPrimNNA = ArrayAccessPrimNNA

sem_NonWildTypeArguments_NonWildTypeArgumentsC1 = NonWildTypeArgumentsC1
sem_NonWildTypeArguments_NonWildTypeArgumentsC2 = NonWildTypeArgumentsC2
sem_NonWildTypeArguments_NonWildTypeArgumentsC3 = NonWildTypeArgumentsC3
sem_NonWildTypeArguments_NonWildTypeArgumentsC0 = NonWildTypeArgumentsC0
sem_NonWildTypeArguments_NilNonWildTypeArguments = NilNonWildTypeArguments

sem_ArrayInitializer_ArrayInitializer = ArrayInitializer
                                                  
sem_VariableInitializer_VariableInitializerExp = VariableInitializerExp
sem_VariableInitializer_VariableInitializerArr = VariableInitializerArr
                                        
sem_ElementValueArrayInitializer_ElementValueArrayInitializer = ElementValueArrayInitializer

-- -------------------------------------------------------------------------------------------
-- FIN Definicion de Annotations 
-- -------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------
-- Definicion de ImportDeclarations
-- -------------------------------------------------------------------------------------------
sem_ImportDeclarations_ImportDeclarations = ImportDeclarations
sem_ImportDeclarations_NilImportDeclarations = NilImportDeclarations

sem_ImportDeclaration_SingleTypeImportDeclaration = SingleTypeImportDeclaration
sem_ImportDeclaration_TypeImportOnDemandDeclaration = TypeImportOnDemandDeclaration
sem_ImportDeclaration_SingleStaticImportDeclaration = SingleStaticImportDeclaration
sem_ImportDeclaration_StaticImportOnDemandDeclaration = StaticImportOnDemandDeclaration
                                           
sem_PackageOrTypeName_NilPackageOrTypeName = NilPackageOrTypeName
sem_PackageOrTypeName_PackageOrTypeName    = PackageOrTypeName
-- -------------------------------------------------------------------------------------------
-- FIN Definicion de ImportDeclarations
-- -------------------------------------------------------------------------------------------

-- ------------------------------------------------------------------------------------------
-- Definicion de TypeDeclarations
-- ------------------------------------------------------------------------------------------
sem_Modifiers_Modifiers     = Modifiers
sem_Modifiers_NilModifiers  = NilModifiers
                                        
sem_Modifier_ModifierAnnotation     = ModifierAnnotation
sem_Modifier_ModifierPublic         = ModifierPublic
sem_Modifier_ModifierProtected      = ModifierProtected
sem_Modifier_ModifierPrivate        = ModifierPrivate
sem_Modifier_ModifierAbstract       = ModifierAbstract
sem_Modifier_ModifiersStatic        = ModifiersStatic
sem_Modifier_ModifierFinal          = ModifierFinal
sem_Modifier_ModifierStrictfp       = ModifierStrictfp
sem_Modifier_FieldModifierTransient = FieldModifierTransient
sem_Modifier_FieldModifierVolatile  = FieldModifierVolatile
sem_Modifier_MethodModifierSynchronized = MethodModifierSynchronized
sem_Modifier_MethodModifierNative = MethodModifierNative
                           
sem_TypeParameters_TypeParametersC1 = TypeParametersC1
sem_TypeParameters_TypeParametersC2 = TypeParametersC2
sem_TypeParameters_TypeParametersC3 = TypeParametersC3
sem_TypeParameters_TypeParametersC0 = TypeParametersC0
sem_TypeParameters_NilTypeParameters =NilTypeParameters

sem_TypeParameter_TypeParameterBound = TypeParameterBound
sem_TypeParameter_TypeParameter      = TypeParameter
                                      
sem_TypeBound_TypeBound = TypeBound
sem_TypeBound_NilAdditionalBoundList = NilAdditionalBoundList

sem_Super_Super = Super
sem_Super_NilSuper = NilSuper
                        
sem_Interfaces_Interfaces = Interfaces
sem_Interfaces_NilInterfaces = NilInterfaces
                                        
                                                                   
sem_VariableDeclarator_VariableDeclaratorId     = VariableDeclaratorId
sem_VariableDeclarator_VariableDeclaratorIdAsig = VariableDeclaratorIdAsig
                                                                        
sem_VariableDeclaratorId_VarDeclaratorId  = VarDeclaratorId
sem_VariableDeclaratorId_VarDeclaratorIdVDZ = VarDeclaratorIdVDZ
sem_VariableDeclaratorIdZ_VarDeclaratorIdCorchete = VarDeclaratorIdCorchete
sem_VariableDeclaratorIdZ_VarDeclaratorIdZ        = VarDeclaratorIdZ

                                                                                
sem_ResultType_ResultTypeType = ResultTypeType
sem_ResultType_ResultTypeVoid = ResultTypeVoid
                                
sem_MethodDeclarator_MethodDeclaratorFormalPL = MethodDeclaratorFormalPL
sem_MethodDeclarator_MethodDeclaratorSingle   = MethodDeclaratorSingle
                                          
sem_FormalParameterList_FormalParameterListLast    = FormalParameterListLast
sem_FormalParameterList_FormalParameterListFormal = FormalParameterListFormal
sem_FormalParameterList_FormalParameterListNil = FormalParameterListNil
                                                                                                 
sem_VariableModifiers_VariableModifiers    = VariableModifiers
sem_VariableModifiers_NilVariableModifiers = NilVariableModifiers
                                           
sem_VariableModifier_VariableModifierFinal      = VariableModifierFinal
sem_VariableModifier_VariableModifierAnnotation = VariableModifierAnnotation                                      
                                                                                          
sem_Throws_Throws = Throws
sem_Throws_NilThrows = NilThrows
                        
sem_ExceptionType_ExceptionTypeClassType = ExceptionTypeClassType
-- sem_ExceptionType_ExceptionTypeTypeVariable = ExceptionTypeTypeVariable
                                   
sem_MethodBody_MethodBodyBlock     = MethodBodyBlock
sem_MethodBody_MethodBodySemiColon = MethodBodySemiColon 
                                                    
sem_BlockStatement_BlockStatementLocalVariableDeclarationStatement    = BlockStatementLocalVariableDeclarationStatement
sem_BlockStatement_BlockStatementStatement = BlockStatementStatement
sem_BlockStatement_BlockStatementClassDeclarationNormalClassDeclaration = BlockStatementClassDeclarationNormalClassDeclaration
sem_BlockStatement_BlockStatementClassDeclarationEnumDeclaration = BlockStatementClassDeclarationEnumDeclaration
                                                          
sem_Statement_StatementLabeled = StatementLabeled
sem_Statement_StatementIf          = StatementIf
sem_Statement_StatementIfElse  = StatementIfElse
sem_Statement_StatementWhile   = StatementWhile
sem_Statement_StatementFor         = StatementFor
                           
sem_Statement_SWTSBlock                            = SWTSBlock
sem_Statement_SWTSEmptyStatement                   = SWTSEmptyStatement
sem_Statement_SWTSExpressionStatement              = SWTSExpressionStatement
sem_Statement_SWTSAssertStatementCondEx            = SWTSAssertStatementCondEx
sem_Statement_SWTSAssertStatementCond              = SWTSAssertStatementCond
sem_Statement_SWTSSwitchStatement                      = SWTSSwitchStatement
sem_Statement_SWTSDoStatement                          = SWTSDoStatement
sem_Statement_SWTSBreakStatement                           = SWTSBreakStatement
sem_Statement_SWTSBreakStatementId                     = SWTSBreakStatementId
sem_Statement_SWTSNilContinueStatement             = SWTSNilContinueStatement
sem_Statement_SWTSContinueStatement                = SWTSContinueStatement
sem_Statement_SWTSReturnStatement                  = SWTSReturnStatement
sem_Statement_SWTSNilReturnStatement               = SWTSNilReturnStatement
sem_Statement_SWTSynchronizedStatement             = SWTSynchronizedStatement
sem_Statement_SWTTrhowStatement                    = SWTTrhowStatement
sem_Statement_SWTTryStatement                      = SWTTryStatement
sem_Statement_SWTTryStatementFinally               = SWTTryStatementFinally


sem_StatementNested_StatementLabeledNested = StatementLabeledNested
sem_StatementNested_StatementIfNested = StatementIfNested
sem_StatementNested_StatementIfElseNested = StatementIfElseNested
sem_StatementNested_StatementWhileNested = StatementWhileNested
sem_StatementNested_StatementForNested = StatementForNested
sem_StatementNested_SWTSBlockNested = SWTSBlockNested
sem_StatementNested_SWTSEmptyStatementNested = SWTSEmptyStatementNested
sem_StatementNested_SWTSExpressionStatementNested = SWTSExpressionStatementNested
sem_StatementNested_SWTSAssertStatementCondNested = SWTSAssertStatementCondNested
sem_StatementNested_SWTSAssertStatementCondExNested = SWTSAssertStatementCondExNested
sem_StatementNested_SWTSSwitchStatementNested = SWTSSwitchStatementNested
sem_StatementNested_SWTSDoStatementNested = SWTSDoStatementNested
sem_StatementNested_SWTSBreakStatementNested = SWTSBreakStatementNested
sem_StatementNested_SWTSBreakStatementIdNested = SWTSBreakStatementIdNested
sem_StatementNested_SWTSNilContinueStatementNested = SWTSNilContinueStatementNested
sem_StatementNested_SWTSContinueStatementNested = SWTSContinueStatementNested
sem_StatementNested_SWTSReturnStatementNested = SWTSReturnStatementNested
sem_StatementNested_SWTSNilReturnStatementNested = SWTSNilReturnStatementNested
sem_StatementNested_SWTSynchronizedStatementNested = SWTSynchronizedStatementNested
sem_StatementNested_SWTTrhowStatementNested = SWTTrhowStatementNested
sem_StatementNested_SWTTryStatementNested = SWTTryStatementNested
sem_StatementNested_SWTTryStatementFinallyNested = SWTTryStatementFinallyNested

sem_SwitchBlock_SwitchBlockAll    = SwitchBlockAll
sem_SwitchBlock_SwitchBlockLabels = SwitchBlockLabels
sem_SwitchBlock_NilSwitchBlock    =     NilSwitchBlock 
sem_SwitchBlock_SwitchBlockGroups = SwitchBlockGroups
                                                                                                
sem_SwitchBlockStatementGroup_SwitchBlockStatementGroup = SwitchBlockStatementGroup                                                             
                                                                
sem_SwitchLabel_SwitchLabelConstant = SwitchLabelConstant
sem_SwitchLabel_SwitchLabelEnum         = SwitchLabelEnum
sem_SwitchLabel_SwitchLabelDefault      = SwitchLabelDefault
                                          
sem_ForInit_ForInitStaExp   = ForInitStaExp
sem_ForInit_ForInitLocalVar = ForInitLocalVar
sem_ForInit_NilForInit      = NilForInit
                         
sem_StatementExpressionList_StatementExpressionList    = StatementExpressionList
sem_StatementExpressionList_NilStatementExpressionList = NilStatementExpressionList
                                                          
sem_ForUpdate_ForUpdate    = ForUpdate
sem_ForUpdate_NilForUpdate = NilForUpdate

sem_ForStatement_ForStatementBasicForStatementAll           = ForStatementBasicForStatementAll 
sem_ForStatement_ForStatementBasicForStatementNoExp         = ForStatementBasicForStatementNoExp 
sem_ForStatement_ForStatementEnhancedForStatement           = ForStatementEnhancedForStatement  
sem_ForStatement_ForStatementEnhancedForStatementNoVarModif = ForStatementEnhancedForStatementNoVarModif 

sem_ExtendsInterfaces_ExtendsInterfaceType = ExtendsInterfaceType
sem_ExtendsInterfaces_NilExtendsInterfaces  = NilExtendsInterfaces

sem_InterfaceMemberDeclaration_InterfaceMemberDeclarationConstant                                     = InterfaceMemberDeclarationConstant 
sem_InterfaceMemberDeclaration_InterfaceMemberDeclarationAbstract                                     = InterfaceMemberDeclarationAbstract
sem_InterfaceMemberDeclaration_InterfaceMemberDeclTypeDeclarationClassDeclarationNormalCD             = InterfaceMemberDeclTypeDeclarationClassDeclarationNormalCD
sem_InterfaceMemberDeclaration_InterfaceMemberDeclTypeDeclarationClassDeclarationEnumD                = InterfaceMemberDeclTypeDeclarationClassDeclarationEnumD 
sem_InterfaceMemberDeclaration_InterfaceMemberDeclTypeDeclarationInterfaceDeclarationNormalInterfaceD = InterfaceMemberDeclTypeDeclarationInterfaceDeclarationNormalInterfaceD 
sem_InterfaceMemberDeclaration_InterfaceMemberDeclTypeDeclarationInterfaceDeclarationAnnotationTypeD  = InterfaceMemberDeclTypeDeclarationInterfaceDeclarationAnnotationTypeD  
sem_InterfaceMemberDeclaration_InterfaceMemberDeclTypeDeclarationSemiColon                                                        = InterfaceMemberDeclTypeDeclarationSemiColon

sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclTypeDeclarationClassDeclarationNormalCD             = AnnTypeElemDeclTypeDeclarationClassDeclarationNormalCD
sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclTypeDeclarationClassDeclarationEnumD                = AnnTypeElemDeclTypeDeclarationClassDeclarationEnumD
sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclTypeDeclarationInterfaceDeclarationNormalInterfaceD = AnnTypeElemDeclTypeDeclarationInterfaceDeclarationNormalInterfaceD
sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclTypeDeclarationInterfaceDeclarationAnnotationTypeD  = AnnTypeElemDeclTypeDeclarationInterfaceDeclarationAnnotationTypeD
sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclTypeDeclarationSemiColon                            = AnnTypeElemDeclTypeDeclarationSemiColon
sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclAbstract                                            = AnnTypeElemDeclAbstract
sem_AnnotationTypeElementDeclaration_AnnTypeElemDeclConstant                                            = AnnTypeElemDeclConstant
                                       
sem_DefaultValue_DefaultValue = DefaultValue
sem_DefaultValue_NilDefaultValue = NilDefaultValue

sem_EnumBodyDeclarations_NilEnumBodyDeclarations = NilEnumBodyDeclarations

sem_EnumBody_EnumBody              = EnumBody

sem_EnumConstants_EnumConstants    = EnumConstants
sem_EnumConstants_NilEnumConstants = NilEnumConstants
                   
sem_EnumConstant_EnumConstantAll = EnumConstantAll -- Annotations Identifier ArgumentList ClassBody  -- Arguments por ArgumentList y ()
sem_EnumConstant_EnumConstantArgL = EnumConstantArgL -- Annotations Identifier ArgumentList 
sem_EnumConstant_EnumConstantClasB = EnumConstantClasB -- Annotations Identifier ClassBody
sem_EnumConstant_EnumConstantNothing = EnumConstantNothing -- Annotations Identifier

sem_EnumBodyDeclarations_EnumBodyDeclarations = EnumBodyDeclarations

sem_ConstructorBody_ConstructorBody = ConstructorBody

sem_ExplicitConstructorInvocation_ExplConsInvThis    = ExplConsInvThis
sem_ExplicitConstructorInvocation_ExplConsInvSuper   = ExplConsInvSuper
sem_ExplicitConstructorInvocation_ExplConsInvPrimary = ExplConsInvPrimary
sem_ExplicitConstructorInvocation_NilExplixitConsInv = NilExplixitConsInv

sem_CatchClause_CatchClause = CatchClause
-- -------------------------------------------------------------------------------------------
-- Fin de TypeDeclarations
-- -------------------------------------------------------------------------------------------