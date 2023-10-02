import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.FileOutputStream;

public class TransformXmlToHtml {

    public void transformXmlToHtml(String xmlFilePath, String htmlFilePath) {
        try {
            // Carrega o arquivo XML de entrada
            File inputFile = new File(xmlFilePath);

            // Cria um objeto StreamSource para o XML
            StreamSource source = new StreamSource(inputFile);

            // Cria um arquivo de saída HTML
            FileOutputStream htmlOutput = new FileOutputStream(htmlFilePath);

            // Cria um objeto StreamResult para o resultado HTML
            StreamResult htmlResult = new StreamResult(htmlOutput);

            // Cria uma fábrica de transformadores
            TransformerFactory transformerFactory = TransformerFactory.newInstance();

            // Carrega a folha de estilo XSLT para a transformação (vamos criar um arquivo xslt chamado "transform.xslt")
            StreamSource xsltStream = new StreamSource(new File("transform3.xslt"));

            // Cria um transformador usando a folha de estilo XSLT
            Transformer transformer = transformerFactory.newTransformer(xsltStream);

            // Define as propriedades da transformação, como a saída HTML
            transformer.setOutputProperty(OutputKeys.METHOD, "html");

            // Realiza a transformação do XML em HTML
            transformer.transform(source, htmlResult);

            // Fecha o arquivo de saída HTML
            htmlOutput.close();

            System.out.println("Transformação concluída. Resultado salvo em " + htmlFilePath);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
