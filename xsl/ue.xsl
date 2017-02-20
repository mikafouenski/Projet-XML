<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template name="creer_ue">
        <xsl:for-each select="//ue">
            <xsl:result-document method="html" href="ue/{@id}.html">
                <xsl:text disable-output-escaping='yes'>&lt;!doctype html&gt;</xsl:text>
                <html>
                    <xsl:call-template name="head"/>
                    <body>
                        <header>
                            <nav class="top-nav" role="navigation">
                                <div class="container">
                                    <div class="nav-wrapper">
                                        <xsl:call-template name="menu"/>
                                        <a class="page-title">
                                            <xsl:value-of select="nom"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="prenom"/>
                                        </a>
                                    </div>
                                </div>
                            </nav>
                        </header>
                        <div class="container">
                            <p>Crédit : <xsl:value-of select="credit"/></p>
                            <p>Description : </p>
                            <xsl:copy-of select="description/*"/>
                            <ul class="collection with-header">
                                <li class="collection-header"><h4>Intervenants</h4></li>
                                <xsl:for-each select="ref-intervenant">
                                    <li  class="collection-item"><a>
                                        <xsl:attribute name="href">../inter/<xsl:value-of select="@ref"/>.html</xsl:attribute>
                                        <xsl:value-of select="@ref"/>
                                    </a></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                        <xsl:call-template name="scripts"/>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
