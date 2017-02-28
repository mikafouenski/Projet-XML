<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template name="creer_parcours">
        <xsl:for-each select="/master/parcours">
            <xsl:result-document method="html" href="www/parcours/{@id}.html">
                <xsl:text disable-output-escaping='yes'>&lt;!doctype html&gt;</xsl:text>
                <html>
                    <xsl:call-template name="head"/>
                    <body>
                        <xsl:call-template name="header"/>
                        <main>
                            <div class="container">
                                <p>Description : </p>
                                <xsl:copy-of select="description/*"/>
                                <ul class="collection with-header">
                                    <li class="collection-header"><h4>Débouchés</h4></li>
                                    <xsl:for-each select="debouche">
                                        <li class="collection-item">
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                                <ul class="collection with-header">
                                    <li class="collection-header"><h4>Responsables</h4></li>
                                    <xsl:for-each select="ref-responsable">
                                        <li class="collection-item"><a>
                                            <xsl:attribute name="href">../intervenant/<xsl:value-of select="@ref"/>.html</xsl:attribute>
                                            <xsl:value-of select="/master/intervenant[@id = current()/@ref]/nom"/>
                                        </a></li>
                                    </xsl:for-each>
                                </ul>
                                <xsl:for-each select="semestre">
                                    <ul class="collection with-header">
                                        <li class="collection-header"><h4>Semestre <xsl:value-of select="position()"/></h4></li>
                                        <xsl:for-each select="ref-ue">
                                            <li class="collection-item">
                                                <xsl:if test='following-sibling::role[1][@obligatoire = "V"]'>
                                                    <span class="new badge" data-badge-caption="Obligatoire">! </span>
                                                </xsl:if>
                                                <a><xsl:attribute name="href">../ue/<xsl:value-of select="@ref"/>.html</xsl:attribute>
                                                    <xsl:value-of select="/master/ue[@id = current()/@ref]/nom"/>
                                                </a>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </xsl:for-each>
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
