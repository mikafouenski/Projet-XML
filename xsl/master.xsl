<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:import href="includes/head.xsl"/>
    <xsl:import href="includes/header.xsl"/>
    <xsl:import href="includes/scripts.xsl"/>
    <xsl:import href="includes/footer.xsl"/>

    <xsl:import href="index.xsl"/>
    <xsl:import href="ue.xsl"/>
    <xsl:import href="intervenant.xsl"/>
    <xsl:import href="parcours.xsl"/>

    <xsl:template match="/">
        <!-- Point d'entrée -->
        <xsl:call-template name="creer_index"/>
        <xsl:call-template name="creer_ue"/>
        <xsl:call-template name="creer_intervenant"/>
        <xsl:call-template name="creer_parcours"/>
    </xsl:template>

</xsl:stylesheet>
