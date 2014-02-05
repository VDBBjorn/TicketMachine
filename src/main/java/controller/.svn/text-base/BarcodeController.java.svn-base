package controller;

import java.io.IOException;
import org.krysalis.barcode4j.BarcodeGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.Barcoder;


@Controller
public class BarcodeController 
{
    @RequestMapping("barcode/{id}")
    public @ResponseBody
            byte[] getBarcode(@PathVariable("id") final String id) throws IOException {        
        return Barcoder.generateBarcode(id);
    }
}
