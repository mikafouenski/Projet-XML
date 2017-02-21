<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template name="creer_ue">
        <xsl:for-each select="//ue">
            <xsl:result-document method="html" href="www/ue/{@id}.html">
                <xsl:text disable-output-escaping='yes'>&lt;!doctype html&gt;</xsl:text>
                <html>
                    <xsl:call-template name="head"/>
                    <body>
                        <xsl:call-template name="header"/>
                        <main>
                            <div class="container">
                                <p>Crédit : <xsl:value-of select="credit"/></p>
                                <p>Description : </p>
                                <xsl:copy-of select="description/*"/>
                                <ul class="collection with-header">
                                    <li class="collection-header"><h4>Intervenants</h4></li>
                                    <xsl:for-each select="ref-intervenant">
                                        <li  class="collection-item"><a>
                                            <xsl:attribute name="href">../intervenant/<xsl:value-of select="@ref"/>.html</xsl:attribute>
                                            <xsl:value-of select="/master/intervenant[@id = current()/@ref]/nom"/>
                                        </a></li>
                                    </xsl:for-each>
                                </ul>
                            </div>
                            <xsl:call-template name="scripts"/>
                        </main>
                        <xsl:call-template name="footer"/>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
