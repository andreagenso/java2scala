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

// Pablo's example
public class GenerationTests {

    private static int estatica;
    private static final int xxx;

    public static void main(String[] args) {
        GenerationTests instancia1 = new GenerationTests();
        GenerationTests instancia2 = new GenerationTests();

        instancia1.estatica = 4;
        System.out.println("Estatica: " + estatica);
        instancia2.estatica = 6;
        System.out.println("Estatica: " + estatica);
    }
}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

    static volatile int i = 0, j = 0;

    private static byte attr1;
    private static short attr2;
    private static int attr3;
    private static long attr4;
    private static float attr5;
    private static double attr6;
    private static char attr7;
    private static boolean attr8;


}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac = null;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}

public class GenerationTests {

    private static XMLSignatureFactory fac;
    private static KeyInfoFactory kifac;
    private static DocumentBuilder db;
    private static CanonicalizationMethod withoutComments;

}
