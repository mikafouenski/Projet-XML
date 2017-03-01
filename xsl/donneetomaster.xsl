<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:result-document method="xml" href="master/master.xml" doctype-system="master.dtd">
            <master>

                <xsl:for-each select="/objets/objet[@type = 'enseignement']">
                    <ue>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <nom>
                            <xsl:value-of select="info[@nom = 'nom']/@value"/>
                        </nom>
                        <credit>
                            <xsl:value-of select="info[@nom = 'nb_credits']/@value"/>
                        </credit>
                        <vol_horaire>
                            <xsl:value-of select="info[@nom = 'vol_global']/@value"/>
                        </vol_horaire>
                        <description>
                            <xsl:copy-of select="info[@nom = 'contenu']/*"/>
                        </description>
                        <plan>Plan ?</plan>
                        <lieu>Luminy</lieu>
                        <xsl:for-each select="info[@nom = 'responsables']">
                            <ref-intervenant>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="@value"/>
                                </xsl:attribute>
                            </ref-intervenant>
                        </xsl:for-each>
                    </ue>
                </xsl:for-each>

                <xsl:for-each select="/objets/objet[@type = 'personne']">
                    <intervenant>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <nom>
                            <xsl:value-of select="info[@nom = 'nom']/@value"/>
                        </nom>
                        <prenom>
                            <xsl:value-of select="info[@nom = 'prenom']/@value"/>
                        </prenom>
                        <mail>
                            <xsl:value-of select="info[@nom = 'mail']/@value"/>
                        </mail>
                        <site>http://sitenul.toubkal.org/</site>
                        <xsl:for-each select="/objets/objet[@type = 'enseignement'][info/@nom = 'responsables'][info/@value = current()/@id]">
                            <ref-ue>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="@id"/>
                                </xsl:attribute>
                            </ref-ue>
                        </xsl:for-each>
                    </intervenant>
                </xsl:for-each>

                <xsl:for-each select="/objets/objet[@type = 'programme']">
                    <parcours>
                        <xsl:attribute name="id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <nom>
                            <xsl:value-of select="info[@nom = 'nom']/@value"/>
                        </nom>
                        <description>
                            <xsl:copy-of select="info[@nom = 'objectifs']/*"/>
                        </description>
                        <debouche>Débouchés ?</debouche>
                        <xsl:for-each select="info[@nom = 'structure']">
                            <semestre>
                                <xsl:for-each select="/objets/objet[@type = 'semestre'][@id = current()/@value]/info[@nom = 'structure']">
                                    <xsl:choose>
                                        <xsl:when test="starts-with(@value, 'EN')">
                                            <!-- OBLIGATOIRE -->
                                            <ref-ue>
                                                <xsl:attribute name="ref">
                                                    <xsl:value-of select="@value"/>
                                                </xsl:attribute>
                                            </ref-ue>
                                            <role obligatoire="V"/>
                                        </xsl:when>
                                        <xsl:when test="starts-with(@value, 'CP')">
                                            <xsl:for-each select="/objets/objet[@type = 'option'][@id = current()/@value]/info[@nom = 'structure']">
                                                <!-- OPTION -->
                                                <ref-ue>
                                                    <xsl:attribute name="ref">
                                                        <xsl:value-of select="@value"/>
                                                    </xsl:attribute>
                                                </ref-ue>
                                                <role obligatoire="F"/>
                                            </xsl:for-each>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:for-each>
                            </semestre>
                        </xsl:for-each>
                        <xsl:for-each select="info[@nom = 'responsable-rof']">
                            <ref-responsable>
                                <xsl:attribute name="ref">
                                    <xsl:value-of select="@value"/>
                                </xsl:attribute>
                            </ref-responsable>
                        </xsl:for-each>
                    </parcours>
                </xsl:for-each>

            </master>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
