package code.java;

public class Switch {

    private static void generate_hmac_sha1_40() throws Exception {
        System.out.println("Generating ");

        Document doc = dbf.newDocumentBuilder().newDocument();
        XMLSignature sig = new XMLSignature
                (doc, null, XMLSignature.ALGO_ID_MAC_HMAC_SHA1, 40,
                        Canonicalizer.ALGO_ID_C14N_OMIT_COMMENTS);
        try {
            sig.sign(getSecretKey("secret".getBytes("ASCII")));
            System.out.println("FAILED");
            atLeastOneFailed = true;
        } catch (XMLSignatureException xse) {
            System.out.println(xse.getMessage());
            System.out.println("PASSED");
        }
    }

}