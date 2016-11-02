<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.tei-c.org/ns/1.0">

    <xsl:output encoding="UTF-8" indent="yes" />
    <xsl:strip-space elements="*"/>

    <xsl:template match="text()[not(string-length(normalize-space()))]"/>

    <xsl:template match="*[local-name() = 'text']/*[local-name() = 'lexicon']">
        <body>
            <xsl:apply-templates select="*[local-name() = 'ar']">
                <xsl:sort select="*[local-name() = 'k']"/>
            </xsl:apply-templates>
        </body>
    </xsl:template>

    <xsl:template match='@*|node()'>
        <xsl:copy>
            <xsl:apply-templates select='@*|node()'/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
