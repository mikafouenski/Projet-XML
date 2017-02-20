<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="includes/head.xsl"/>
    <xsl:import href="includes/menu.xsl"/>
    <xsl:import href="includes/scripts.xsl"/>

    <xsl:import href="index.xsl"/>
    <xsl:import href="ue.xsl"/>

    <xsl:template match="/">
        <!-- Point d'entrée -->
        <xsl:call-template name="creer_index"/>
        <xsl:call-template name="creer_ue"/>
    </xsl:template>

</xsl:stylesheet>
