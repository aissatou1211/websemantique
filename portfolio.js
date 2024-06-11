function switchLanguage(lang) {
    var xsl = new XMLHttpRequest();
    xsl.open("GET", "portfolio.xsl", true);
    xsl.onreadystatechange = function() {
        if (xsl.readyState === 4 && xsl.status === 200) {
            var xml = new XMLHttpRequest();
            xml.open("GET", "portfolio.xml", true);
            xml.onreadystatechange = function() {
                if (xml.readyState === 4 && xml.status === 200) {
                    var xsltProcessor = new XSLTProcessor();
                    var xslDoc = xsl.responseXML;
                    xsltProcessor.importStylesheet(xslDoc);
                    xsltProcessor.setParameter(null, "lang", lang);
                    var resultDocument = xsltProcessor.transformToFragment(xml.responseXML, document);
                    document.getElementById("content").innerHTML = "";
                    document.getElementById("content").appendChild(resultDocument);
                }
            };
            xml.send();
        }
    };
    xsl.send();
}
