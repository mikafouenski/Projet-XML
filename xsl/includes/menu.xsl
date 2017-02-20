<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template name="menu">
        <ul id="slide-out" class="side-nav">
            <xsl:choose>
                <xsl:when test="ancestor::*">
                    <li><a href="../index.html">Index</a></li>
                </xsl:when>
                <xsl:otherwise>
                    <li><a href="index.html">Index</a></li>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:call-template name="menu_ue"/>
            <xsl:call-template name="menu_intervenant"/>
            <xsl:call-template name="menu_parcours"/>
        </ul>
        <a href="#" data-activates="slide-out" class="button-collapse show-on-large menu-control"><i class="material-icons">menu</i></a>
    </xsl:template>

    <xsl:template name="menu_ue">
        <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
                <li>
                    <a class="collapsible-header">Unités d'enseignements<i class="material-icons">arrow_drop_down</i></a>
                    <div class="collapsible-body">
                        <ul>
                            <xsl:for-each select="//ue">
                                <li><a class="truncate">
                                    <xsl:choose>
                                        <xsl:when test="ancestor::*">
                                            <xsl:attribute name="href">../ue/<xsl:value-of select="@id"/>.html</xsl:attribute>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="href">ue/<xsl:value-of select="@id"/>.html</xsl:attribute>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:value-of select="nom"/>
                                </a></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </li>
            </ul>
        </li>
    </xsl:template>

    <xsl:template name="menu_intervenant">
        <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
                <li>
                    <a class="collapsible-header">Intervenants<i class="material-icons">arrow_drop_down</i></a>
                    <div class="collapsible-body">
                        <ul>
                            <xsl:for-each select="//intervenant">
                                <li><a class="truncate">
                                    <xsl:choose>
                                        <xsl:when test="ancestor::*">
                                            <xsl:attribute name="href">../intervenant/<xsl:value-of select="@id"/>.html</xsl:attribute>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="href">intervenant/<xsl:value-of select="@id"/>.html</xsl:attribute>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:value-of select="nom"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="prenom"/>
                                </a></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </li>
            </ul>
        </li>
    </xsl:template>

    <xsl:template name="menu_parcours">
        <li class="no-padding">
            <ul class="collapsible collapsible-accordion">
                <li>
                    <a class="collapsible-header">Parcours<i class="material-icons">arrow_drop_down</i></a>
                    <div class="collapsible-body">
                        <ul>
                            <xsl:for-each select="//parcours">
                                <li><a class="truncate">
                                    <xsl:choose>
                                        <xsl:when test="ancestor::*">
                                            <xsl:attribute name="href">../parcours/<xsl:value-of select="@id"/>.html</xsl:attribute>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="href">parcours/<xsl:value-of select="@id"/>.html</xsl:attribute>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:value-of select="nom"/>
                                </a></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </li>
            </ul>
        </li>
    </xsl:template>

</xsl:stylesheet>
