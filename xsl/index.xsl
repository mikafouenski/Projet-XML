<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template name="creer_index">
        <xsl:result-document method="html" href="index.html">
            <xsl:text disable-output-escaping='yes'>&lt;!doctype html&gt;</xsl:text>
            <html>
                <xsl:call-template name="head"/>
                <body>
                    <header>
                        <nav class="top-nav" role="navigation">
                            <div class="container">
                                <div class="nav-wrapper">
                                    <xsl:call-template name="menu"/>
                                    <a class="page-title">Données Master</a>
                                </div>
                            </div>
                        </nav>
                    </header>
                    <div class="container">
                        <p>ECCRIIIIIRRRRRRRREEEEE IIIIIIIIICCCCCCCCCIIIIIII !!! :O</p>
                    </div>
                    <xsl:call-template name="scripts"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
