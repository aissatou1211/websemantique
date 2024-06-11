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
            <section id="video">
                <h2><xsl:choose>
                    <xsl:when test="$lang='en'">Video</xsl:when>
                    <xsl:when test="$lang='fr'">Vidéo</xsl:when>
                    <xsl:when test="$lang='zh'">视频</xsl:when>
                </xsl:choose></h2>
                <video controls>
                    <source src="{video.mp4}" type="video/mp4"/>
                    <track label="English" kind="subtitles" srclang="en" src="{english_subtitles.vtt}" default="{$lang='en'}"/>
                    <track label="Français" kind="subtitles" srclang="fr" src="{french_subtitles.vtt}" default="{$lang='fr'}"/>
                    <track label="中文" kind="subtitles" srclang="zh" src="{chinese_subtitles.vtt}" default="{$lang='zh'}"/>
                </video>
            </section>
            <xsl:for-each select="/portfolio/content/sections/section">
                <section id="{@id}">
                    <h2><xsl:value-of select="title/*[local-name()=$lang]"/></h2>
                    <p><xsl:value-of select="content/*[local-name()=$lang]"/></p>
                </section>
            </xsl:for-each>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
