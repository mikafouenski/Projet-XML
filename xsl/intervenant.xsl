<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template name="creer_intervenant">
        <xsl:for-each select="//intervenant">
            <xsl:result-document method="html" href="www/intervenant/{@id}.html">
                <xsl:text disable-output-escaping='yes'>&lt;!doctype html&gt;</xsl:text>
                <html>
                    <xsl:call-template name="head">
                        <xsl:with-param name="title">
                            <xsl:value-of select="nom"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="prenom"/>
                        </xsl:with-param>
                    </xsl:call-template>
                    <body>
                        <xsl:call-template name="header">
                            <xsl:with-param name="page-title">
                                <xsl:value-of select="nom"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="prenom"/>
                            </xsl:with-param>
                        </xsl:call-template>
                        <main>
                            <div class="container">
                                <p>Email : <xsl:value-of select="mail"/></p>
                                <p>Site : <a>
                                    <xsl:attribute name="href"><xsl:value-of select="site"/></xsl:attribute>
                                    <xsl:value-of select="site"/>
                                </a></p>
                                <ul class="collection with-header">
                                    <li class="collection-header"><h4>Unités d'enseignements</h4></li>
                                    <xsl:for-each select="ref-ue">
                                        <li  class="collection-item"><a>
                                            <xsl:attribute name="href">../ue/<xsl:value-of select="@ref"/>.html</xsl:attribute>
                                            <xsl:value-of select="/master/ue[@id = current()/@ref]/nom"/>
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
