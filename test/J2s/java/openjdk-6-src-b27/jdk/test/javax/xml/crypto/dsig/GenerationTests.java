/*
 * Copyright (c) 2005, 2009, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

/**
 * @test
 * @bug 4635230 6283345 6303830 6824440
 * @summary Basic unit tests for generating XML Signatures with JSR 105
 * @compile -XDignore.symbol.file KeySelectors.java SignatureValidator.java
 *     X509KeySelector.java GenerationTests.java
 * @run main GenerationTests
 * @author Sean Mullan
 */

import java.io.*;
import java.math.BigInteger;
import java.security.Key;
import java.security.KeyFactory;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.security.cert.X509CRL;
import java.security.spec.KeySpec;
import java.security.spec.DSAPrivateKeySpec;
import java.security.spec.DSAPublicKeySpec;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;
import java.util.*;
import javax.crypto.SecretKey;
import javax.xml.XMLConstants;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import javax.xml.crypto.Data;
import javax.xml.crypto.KeySelector;
import javax.xml.crypto.OctetStreamData;
import javax.xml.crypto.URIDereferencer;
import javax.xml.crypto.URIReference;
import javax.xml.crypto.URIReferenceException;
import javax.xml.crypto.XMLCryptoContext;
import javax.xml.crypto.XMLStructure;
import javax.xml.crypto.dsig.*;
import javax.xml.crypto.dom.*;
import javax.xml.crypto.dsig.dom.DOMSignContext;
import javax.xml.crypto.dsig.dom.DOMValidateContext;
import javax.xml.crypto.dsig.keyinfo.*;
import javax.xml.crypto.dsig.spec.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

/**
 * Test that recreates merlin-xmldsig-twenty-three test vectors but with
 * different keys and X.509 data.
 */
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;
    private static SignatureMethod dsaSha1, rsaSha1, rsaSha256, rsaSha384, rsaSha512;
    private static DigestMethod sha1, sha256, sha384, sha512;
    private static KeyInfo dsa, rsa, rsa1024;
    private static KeySelector kvks = new KeySelectors.KeyValueKeySelector();
    private static KeySelector sks;
    private static Key signingKey;
    private static PublicKey validatingKey;
    private static Certificate signingCert;
    private static KeyStore ks;
    private final static String DIR = System.getProperty("test.src", ".");
    private final static String DATA_DIR =
            DIR + System.getProperty("file.separator") + "data";
    private final static String KEYSTORE =
            DATA_DIR + System.getProperty("file.separator") + "certs" +
                    System.getProperty("file.separator") + "test.jks";
    private final static String CRL =
            DATA_DIR + System.getProperty("file.separator") + "certs" +
                    System.getProperty("file.separator") + "crl";
    private final static String ENVELOPE =
            DATA_DIR + System.getProperty("file.separator") + "envelope.xml";
    private static URIDereferencer httpUd = null;
    private final static String STYLESHEET =
            "http://www.w3.org/TR/xml-stylesheet";
    private final static String STYLESHEET_B64 =
            "http://www.w3.org/Signature/2002/04/xml-stylesheet.b64";

    public static void main(String args[]) throws Exception {
        setup();
        test_create_signature_enveloped_dsa();
        test_create_signature_enveloping_b64_dsa();
        test_create_signature_enveloping_dsa();
        test_create_signature_enveloping_hmac_sha1_40();
        test_create_signature_enveloping_hmac_sha256();
        test_create_signature_enveloping_hmac_sha384();
        test_create_signature_enveloping_hmac_sha512();
        test_create_signature_enveloping_rsa();
        test_create_signature_external_b64_dsa();
        test_create_signature_external_dsa();
        test_create_signature_keyname();
        test_create_signature_retrievalmethod_rawx509crt();
        test_create_signature_x509_crt_crl();
        test_create_signature_x509_crt();
        test_create_signature_x509_is();
        test_create_signature_x509_ski();
        test_create_signature_x509_sn();
//      test_create_signature();
        test_create_exc_signature();
        test_create_sign_spec();
        test_create_signature_enveloping_sha256_dsa();
        test_create_signature_enveloping_sha384_rsa_sha256();
        test_create_signature_enveloping_sha512_rsa_sha384();
        test_create_signature_enveloping_sha512_rsa_sha512();
    }

    private static void setup() throws Exception {
        fac = XMLSignatureFactory.getInstance();
        kifac = fac.getKeyInfoFactory();
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setNamespaceAware(true);
        db = dbf.newDocumentBuilder();

        // get key & self-signed certificate from keystore
        FileInputStream fis = new FileInputStream(KEYSTORE);
        ks = KeyStore.getInstance("JKS");
        ks.load(fis, "changeit".toCharArray());
        signingKey = ks.getKey("user", "changeit".toCharArray());
        signingCert = ks.getCertificate("user");
        //validatingKey = signingCert.getPublicKey();

        // create common objects

    }

}
