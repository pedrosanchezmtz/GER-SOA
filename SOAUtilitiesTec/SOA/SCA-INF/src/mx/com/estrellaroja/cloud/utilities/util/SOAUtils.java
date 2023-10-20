package mx.com.estrellaroja.cloud.utilities.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;

import java.util.Base64;

public class SOAUtils {
    public SOAUtils() {
        super();
    }

    /**
     * Metodo que c&oacute;difica un archivo en base 64
     * @param fileToEncode  Objeto File
     * @return   Una cedena con le resultado base 64
     * @throws Exception
     */
    public static String encodeBase64FromFile(File fileToEncode) throws Exception {
        String encodeBase64 = "";
        if (fileToEncode != null) {

            if (fileToEncode.exists()) {
                int length = (int) fileToEncode.length();
                BufferedInputStream reader;

                reader = new BufferedInputStream(new FileInputStream(fileToEncode));
                byte[] bytes = new byte[length];
                reader.read(bytes, 0, length);
                reader.close();
                encodeBase64 = Base64.getEncoder().encodeToString(bytes);

            }


        }
        return encodeBase64;
    }
}
