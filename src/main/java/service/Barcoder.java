package service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.imageio.ImageIO;
import org.krysalis.barcode4j.impl.code39.Code39Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.UnitConv;

public class Barcoder 
{
    public static byte[] generateBarcode(String barcode){
        OutputStream out = null;
        try {
            Code39Bean bean = new Code39Bean();
            final int dpi = 150;
            //bean.setModuleWidth(UnitConv.in2mm(1.0f / dpi));
            bean.setModuleWidth(1.5);
            bean.setWideFactor(3);
            bean.setBarHeight(100);
            bean.setFontSize(25);
            bean.doQuietZone(false);

            File outputFile = new File("barcode.png");
            out = new FileOutputStream(outputFile);
            BitmapCanvasProvider canvas = new BitmapCanvasProvider(out, "image/x-png", dpi, BufferedImage.TYPE_BYTE_BINARY, false, 0);
            bean.generateBarcode(canvas, barcode);
            canvas.finish();

            BufferedImage img = canvas.getBufferedImage();
            ByteArrayOutputStream bao = new ByteArrayOutputStream();
            ImageIO.write(img, "png", bao);

            return bao.toByteArray();

        } catch (FileNotFoundException ex) {
            ex.printStackTrace();
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            try {
                if(out!=null)
                    out.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }
    
   
}

