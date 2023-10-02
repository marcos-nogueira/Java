
public class XMLtoHTMLTransformer {
    public static void main(String[] args) {
        // Caminho para o arquivo XML de entrada
        String xmlFilePath = "documento3Placas.xml";

        // Caminho para o arquivo HTML de saída
        String htmlFilePath = "output.html";

        TransformXmlToHtml result = new TransformXmlToHtml();
        result.transformXmlToHtml(xmlFilePath, htmlFilePath);

    }
}
