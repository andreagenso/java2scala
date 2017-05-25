package code.java

object Switch {
  @throws[Exception]
  private def generate_hmac_sha1_40 {
    System.out.println("Generating ")
    val doc: Nothing = dbf.newDocumentBuilder.newDocument
    val sig: Nothing = new Nothing(doc, null, XMLSignature.ALGO_ID_MAC_HMAC_SHA1, 40, Canonicalizer.ALGO_ID_C14N_OMIT_COMMENTS)
    try {
      sig.sign(getSecretKey("secret".getBytes("ASCII")))
      System.out.println("FAILED")
      atLeastOneFailed = true
    }
    catch {
      case xse: Nothing => {
        System.out.println(xse.getMessage)
        System.out.println("PASSED")
      }
    }
  }
}