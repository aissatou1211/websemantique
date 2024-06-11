<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:param name="lang" select="'en'"/>
    
    <xsl:template match="/">
        <html lang="{$lang}">
        <head>
            <meta charset="UTF-8"/>
            <title><xsl:value-of select="/portfolio/rdf:RDF/rdf:Description/dc:title"/></title>
            <link rel="stylesheet" type="text/css" href="portfolio.css"/>
        </head>
        <body>
            <header>
                <h1><xsl:value-of select="/portfolio/rdf:RDF/rdf:Description/dc:title"/></h1>
            </header>
            <nav>
                <ul>
                    <li><a href="#" onclick="switchLanguage('en')">English</a></li>
                    <li><a href="#" onclick="switchLanguage('fr')">Français</a></li>
                    <li><a href="#" onclick="switchLanguage('zh')">中文</a></li>
                </ul>
            </nav>
            <div id="content">
                <xsl:for-each select="/portfolio/content/sections/section">
                    <section id="{@id}">
                        <h2><xsl:value-of select="title/*[local-name()=$lang]"/></h2>
                        <p><xsl:value-of select="content/*[local-name()=$lang]"/></p>
                    </section>
                </xsl:for-each>
            </div>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
