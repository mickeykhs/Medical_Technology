<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.hce {margin:0;padding:0;position:absolute;overflow:hidden;}
.hme {margin:0;padding:0;position:absolute;}
.hhe {margin:0;padding:0;position:relative;}
.hhi {display:inline-block;margin:0;padding:0;position:relative;background-size:contain;}
.hls {margin:0;padding:0;position:absolute;}
.hfS {margin:0;padding:0;position:absolute;}
.hcD {margin:0;padding:0;position:absolute;}
.hcI {margin:0;padding:0;position:absolute;}
.hcS {margin:0;padding:0;position:absolute;}
.hfN {margin:0;padding:0;position:relative;}
.hmB {margin:0;padding:0;position:absolute;}
.hmO {margin:0;padding:0;position:absolute;}
.hmT {margin:0;padding:0;position:absolute;}
.hpN {display:inline-block;margin:0;padding:0;position:relative;white-space:nowrap;}
.htC {display:inline-block;margin:0;padding:0;position:relative;vertical-align:top;overflow:hidden;}
.haN {display:inline-block;margin:0;padding:0;position:relative;}
.hdu {margin:0;padding:0;position:relative;}
.hdS {margin:0;padding:0;position:absolute;}
.hsC {margin:0;padding:0;position:absolute;}
.hsR {margin:0;padding:0;position:absolute;}
.hsG {margin:0;padding:0;position:absolute;}
.hsL {margin:0;padding:0;position:absolute;}
.hsT {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsE {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsA {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsP {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsV {margin:0;padding:0;position:absolute;overflow:hidden;}
.hsO {margin:0;padding:0;position:absolute;}
.hsU {margin:0;padding:0;position:absolute;overflow:hidden;}
.hpi {margin:0;padding:0;position:absolute;}
.hch {margin:0;padding:0;position:absolute;}
.hcG {margin:0;padding:0;position:absolute;}
.heq {margin:0;padding:0;position:absolute;}
.heG {margin:0;padding:0;position:absolute;}
.htA {margin:0;padding:0;position:absolute;}
.hvi {margin:0;padding:0;position:absolute;}
.htb {margin:0;padding:0;position:absolute;}
.htG {margin:0;padding:0;position:absolute;}
.hfJ {margin:0;padding:0;position:absolute;}
.hfG {margin:0;padding:0;position:absolute;}
.hfB {margin:0;padding:0;position:absolute;}
.hfR {margin:0;padding:0;position:absolute;}
.hfC {margin:0;padding:0;position:absolute;}
.hfO {margin:0;padding:0;position:absolute;}
.hfL {margin:0;padding:0;position:absolute;}
.hfM {margin:0;padding:0;position:absolute;}
.hfE {margin:0;padding:0;position:absolute;}
.hpl {margin:0;padding:0;position:absolute;}
.hs {margin:0;padding:0;position:absolute;overflow:visible;}
.hpa {position:relative;padding:0;overflow:hidden;margin-left:2mm;margin-right:0mm;margin-bottom:2mm;margin-top:0mm;border:1px black solid;box-shadow:1mm 1mm 0 #AAAAAA;}
.hpa::after {content:'';position:absolute;margin:0;padding:0;left:0;right:0;top:0;bottom:0;background-color:white;z-index:-2;}
.hrt {display:inline-block;margin:0;padding:0;position:relative;white-space:inherit;vertical-align:middle;line-height:1.1;}
.hco {display:inline-block;margin:0;padding:0;position:relative;white-space:inherit;}
.hcc {margin:0;padding:0;position:absolute;}
.hls {clear:both;}
[onclick] {cursor:pointer;}
.cs0 {font-size:10pt;color:#ffffff;font-family:"바탕";}
.cs1 {font-size:10pt;color:#ffffff;font-family:"돋움";}
.cs2 {font-size:15pt;color:#ffffff;font-family:"돋움";}
.cs3 {font-size:20pt;color:#ffffff;font-family:"휴먼옛체", "한양궁서";}
.cs4 {font-size:20pt;color:#ffffff;font-family:"돋움";}
.cs5 {font-size:30pt;color:#ffffff;font-family:"돋움";}
.cs6 {font-size:9pt;color:#ffffff;font-family:"바탕";}
.cs7 {font-size:9pt;color:#ffffff;font-family:"돋움";}
.cs8 {font-size:11pt;color:#ffffff;font-family:"굴림체";}
.cs9 {font-size:12pt;color:#ffffff;font-family:"굴림체";}
.cs10 {font-size:12pt;color:#ffffff;font-family:"굴림체";}
.cs10::after {content:'';position:absolute;left:0;right:0;top:0;bottom:0;z-index:-1;background-image:url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiPjxsaW5lIHgxPSIwIiB5MT0iOTQlIiB4Mj0iMTAwJSIgeTI9Ijk0JSIgc3R5bGU9InN0cm9rZTpyZ2IoMCwwLDApO3N0cm9rZS13aWR0aDowLjJtbSIvPjwvc3ZnPg==');}
.cs11 {font-size:10pt;color:#ffffff;font-family:"굴림체";}
.cs12 {font-size:11pt;color:#ffffff;font-family:"굴림체";font-weight:bold;}
.cs13 {font-size:10pt;color:#ffffff;font-family:"굴림체";font-weight:bold;}
.cs14 {font-size:9pt;color:#ffffff;font-family:"굴림체";}
.cs15 {font-size:18pt;color:#ffffff;font-family:"굴림체";font-weight:bold;}
.cs16 {font-size:15pt;color:#ffffff;font-family:"굴림체";font-weight:bold;}
.cs17 {font-size:8pt;color:#ffffff;font-family:"굴림체";}
.cs18 {font-size:15pt;color:#ffffff;font-family:"굴림체";}
.cs19 {font-size:9pt;color:#ffffff;font-family:"굴림체";font-weight:bold;}
.cs20 {font-size:10pt;color:#ffffff;font-family:"굴림체";}
.cs20::after {content:'';position:absolute;left:0;right:0;top:0;bottom:0;z-index:-1;background-image:url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiPjxsaW5lIHgxPSIwIiB5MT0iOTQlIiB4Mj0iMTAwJSIgeTI9Ijk0JSIgc3R5bGU9InN0cm9rZTpyZ2IoMCwwLDApO3N0cm9rZS13aWR0aDowLjJtbSIvPjwvc3ZnPg==');}
.ps0 {text-align:justify;}
.ps1 {text-align:center;}
.ps2 {text-align:justify;}
.ps3 {text-align:left;}
.ps4 {text-align:center;}
.ps5 {text-align:right;}
.ps6 {text-align:justify;}
.ps7 {text-align:justify;}
.ps8 {text-align:left;}
.ps9 {text-align:justify;}
@media print {
.hpa {margin:0;border:0 black none;box-shadow:none;}
body {padding:0;}

}
</style>
<div class="box">
    <div class="hpa" style="width:192mm;height:224mm;margin:0;">
        <div class="hcD" style="left:10mm;top:10mm;">
            <div class="hcI">
                <div class="hls ps1"
                    style="line-height:30.34mm;white-space:nowrap;left:0mm;top:0mm;height:30.34mm;width:189.99mm;">
                    <div class="htb"
                        style="left:0.34mm;width:159.51mm;top:0.55mm;height:30.34mm;display:inline-block;position:relative;vertical-align:middle;">
                        <svg class="hs" viewBox="-2.50 -2.50 164.51 35.34"
                            style="left:-2.50mm;top:-2.50mm;width:164.51mm;height:35.34mm;">
                            <path d="M51.77,11.41 L79.59,11.41"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M51.77,11.78 L79.59,11.78"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M79.59,11.41 L99.48,11.41"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M79.59,11.78 L99.48,11.78"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M99.48,11.41 L112.41,11.41"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M99.48,11.78 L112.41,11.78"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M51.77,11.41 L79.59,11.41"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M51.77,11.78 L79.59,11.78"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M79.59,11.41 L99.48,11.41"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M79.59,11.78 L99.48,11.78"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M99.48,11.41 L112.41,11.41"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M99.48,11.78 L112.41,11.78"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M129.33,0 L129.33,29.79"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M159.17,0 L159.17,29.79"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M129.27,0 L159.24,0" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;">
                            </path>
                            <path d="M129.27,7.59 L159.24,7.59"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M129.27,29.79 L159.24,29.79"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M159.17,0 L159.17,29.79"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M129.33,0 L129.33,29.79"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M129.27,29.79 L159.24,29.79"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M129.27,0 L159.24,0" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;">
                            </path>
                        </svg>
                        <div class="hce" style="left:0mm;top:0mm;width:19.90mm;height:11.60mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:3.68mm;">
                                    <div class="hls ps0"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:19.23mm;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:19.90mm;top:0mm;width:31.92mm;height:11.60mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:3.68mm;">
                                    <div class="hls ps0"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:31.26mm;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:51.82mm;top:0mm;width:60.55mm;height:11.60mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:2.62mm;">
                                    <div class="hls ps1"
                                        style="line-height:5.52mm;white-space:nowrap;left:0mm;top:-0.32mm;height:6.35mm;width:59.89mm;">
                                        <span class="hrt cs15">소 &nbsp;견 &nbsp;서</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:112.37mm;top:0mm;width:16.96mm;height:11.60mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:3.68mm;">
                                    <div class="hls ps0"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:16.30mm;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:129.33mm;top:0mm;width:29.84mm;height:7.59mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:1.68mm;">
                                    <div class="hls ps1"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:29.18mm;">
                                        <span class="hrt cs9">원부대조필 인</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:129.33mm;top:7.59mm;width:29.84mm;height:22.20mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:5.60mm;">
                                    <div class="hls ps0"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:29.18mm;">
                                    </div>
                                    <div class="hls ps5"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:6.56mm;height:4.23mm;width:29.18mm;">
                                        <span class="hrt cs9">&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:0mm;top:11.60mm;width:51.82mm;height:8.59mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:2.18mm;">
                                    <div class="hls ps3"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:51.15mm;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:51.82mm;top:11.60mm;width:27.77mm;height:8.59mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:2.18mm;">
                                    <div class="hls ps0"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:27.11mm;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:79.59mm;top:11.60mm;width:19.90mm;height:8.59mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:2.18mm;">
                                    <div class="hls ps0"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:19.23mm;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:99.48mm;top:11.60mm;width:12.88mm;height:8.59mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:2.18mm;">
                                    <div class="hls ps0"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:12.22mm;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:112.37mm;top:11.60mm;width:16.96mm;height:8.59mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:2.18mm;">
                                    <div class="hls ps0"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:16.30mm;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:0mm;top:20.19mm;width:51.82mm;height:9.60mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:2.68mm;">
                                    <div class="hls ps0"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:51.15mm;">
                                        <span class="hrt cs10">담 당 의 :
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:51.82mm;top:20.19mm;width:77.51mm;height:9.60mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:2.68mm;">
                                    <div class="hls ps3"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:76.85mm;">
                                        <span class="hrt cs9">&nbsp;</span><span class="hrt cs10">주민등록번호
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hls ps1"
                    style="line-height:179.30mm;white-space:nowrap;left:0mm;top:32.67mm;height:179.30mm;width:189.99mm;">
                    <div class="htb"
                        style="left:0.34mm;width:159.61mm;top:0.55mm;height:179.30mm;display:inline-block;position:relative;vertical-align:middle;">
                        <svg class="hs" viewBox="-2.50 -2.50 164.61 184.29"
                            style="left:-2.50mm;top:-2.50mm;width:164.61mm;height:184.29mm;">
                            <path d="M0,0 L0,178.75" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;">
                            </path>
                            <path d="M28.55,0 L28.55,22.81"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M28.55,22.81 L28.55,78.15"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
                            <path d="M28.55,78.15 L28.55,129.77"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M65.13,0 L65.13,11.34"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M76.02,0 L76.02,11.34"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M88.93,0 L88.93,11.34"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M97.17,78.15 L97.17,129.77"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M102.11,0 L102.11,11.34"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M115.70,78.15 L115.70,129.77"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M135.49,0 L135.49,11.34"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M141.70,0 L141.70,11.34"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M159.27,0 L159.27,178.75"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
                            <path d="M-0.20,0 L159.48,0" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;">
                            </path>
                            <path d="M-0.20,11.34 L159.48,11.34"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M-0.20,22.81 L159.48,22.81"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M-0.20,78.15 L159.48,78.15"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M-0.20,129.76 L159.48,129.76"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.12;"></path>
                            <path d="M-0.20,178.75 L159.48,178.75"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
                            <path d="M159.27,0 L159.27,178.75"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
                            <path d="M0,0 L0,178.75" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;">
                            </path>
                            <path d="M-0.20,178.75 L159.48,178.75"
                                style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;"></path>
                            <path d="M-0.20,0 L159.48,0" style="stroke:#000000;stroke-linecap:butt;stroke-width:0.40;">
                            </path>
                        </svg>
                        <div class="hce" style="left:0mm;top:0mm;width:28.55mm;height:11.34mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:3.91mm;">
                                    <div class="hls ps4"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:-0.18mm;height:3.53mm;width:27.88mm;">
                                        <span class="hrt cs11">환</span><span class="hrt cs11">자의 성명</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:28.55mm;top:0mm;width:36.58mm;height:11.34mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:3.91mm;">
                                    <div class="hls ps6"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:-0.18mm;height:3.53mm;width:35.91mm;">
                                        <span class="hrt cs11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:65.13mm;top:0mm;width:10.90mm;height:11.34mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:3.55mm;">
                                    <div class="hls ps4"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:10.23mm;">
                                        <span class="hrt cs9">성별</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:76.02mm;top:0mm;width:12.90mm;height:11.34mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:3.91mm;">
                                    <div class="hls ps4"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:-0.18mm;height:3.53mm;width:12.23mm;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:88.93mm;top:0mm;width:13.19mm;height:11.34mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:1.44mm;">
                                    <div class="hls ps4"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:12.52mm;">
                                        <span class="hrt cs9">생년</span></div>
                                    <div class="hls ps4"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:4.02mm;height:4.23mm;width:12.52mm;">
                                        <span class="hrt cs9">월일</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:102.11mm;top:0mm;width:33.37mm;height:11.34mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:3.91mm;">
                                    <div class="hls ps4"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:-0.18mm;height:3.53mm;width:32.71mm;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:135.49mm;top:0mm;width:6.21mm;height:11.34mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:1.44mm;">
                                    <div class="hls ps4"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:5.55mm;">
                                        <span class="hrt cs9">연</span></div>
                                    <div class="hls ps4"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:4.02mm;height:4.23mm;width:5.55mm;">
                                        <span class="hrt cs9">령</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:141.70mm;top:0mm;width:17.58mm;height:11.34mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:3.55mm;">
                                    <div class="hls ps4"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:16.91mm;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:0mm;top:11.34mm;width:28.55mm;height:11.47mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:3.97mm;">
                                    <div class="hls ps1"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:-0.18mm;height:3.53mm;width:27.88mm;">
                                        <span class="hrt cs11">환자의 주소</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:28.55mm;top:11.34mm;width:130.73mm;height:11.47mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:3.62mm;">
                                    <div class="hls ps0"
                                        style="line-height:3.43mm;white-space:nowrap;left:0mm;top:-0.21mm;height:4.23mm;width:130.06mm;">
                                        <span class="hrt cs9"></span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:0mm;top:22.81mm;width:28.55mm;height:55.34mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI">
                                    <div class="hls ps4"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:-0.18mm;height:3.53mm;width:27.88mm;">
                                    </div>
                                    <div class="hls ps1"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:3.35mm;height:3.53mm;width:27.88mm;">
                                    </div>
                                    <div class="hls ps1"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:9mm;height:3.53mm;width:27.88mm;">
                                    </div>
                                    <div class="hls ps1"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:14.64mm;height:3.53mm;width:27.88mm;">
                                    </div>
                                    <div class="hls ps1"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:20.28mm;height:3.53mm;width:27.88mm;">
                                    </div>
                                    <div class="hls ps1"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:25.93mm;height:3.53mm;width:27.88mm;">
                                        <span class="hrt cs11">진료소견</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:28.55mm;top:22.81mm;width:130.73mm;height:55.34mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI">
                                    <div class="hls ps8"
                                        style="line-height:2.79mm;white-space:nowrap;left:0.35mm;top:-0.18mm;height:3.53mm;width:129.71mm;">
                                        <span class="hrt cs11">&nbsp;&nbsp;</span></div>
                                    <div class="hls ps9"
                                        style="line-height:2.79mm;white-space:nowrap;left:0.35mm;top:3.35mm;height:3.53mm;width:129.71mm;">
                                        <span class="hrt cs11">&nbsp;</span></div>
                                    <div class="hls ps9"
                                        style="line-height:2.79mm;white-space:nowrap;left:0.35mm;top:6.88mm;height:3.53mm;width:129.71mm;">
                                    </div>
                                    <div class="hls ps9"
                                        style="line-height:2.79mm;white-space:nowrap;left:0.35mm;top:10.41mm;height:3.53mm;width:129.71mm;">
                                        <span class="hrt cs11">&nbsp;</span></div>
                                    <div class="hls ps9"
                                        style="line-height:2.79mm;white-space:nowrap;left:0.35mm;top:13.93mm;height:3.53mm;width:129.71mm;">
                                        <span class="hrt cs11">&nbsp;</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:0mm;top:78.15mm;width:28.55mm;height:51.61mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:21.22mm;">
                                    <div class="hls ps1"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:-0.18mm;height:3.53mm;width:27.88mm;">
                                        <span class="hrt cs11">비 &nbsp;&nbsp;&nbsp;고</span></div>
                                    <div class="hls ps1"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:5.47mm;height:3.53mm;width:27.88mm;">
                                        <span class="hrt cs11">(이미지)</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:28.55mm;top:78.15mm;width:68.62mm;height:51.61mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:24.39mm;">
                                    <div class="hls ps0"
                                        style="line-height:2.17mm;white-space:nowrap;left:0mm;top:-0.14mm;height:2.82mm;width:67.96mm;">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:97.17mm;top:78.15mm;width:18.53mm;height:51.61mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:24.04mm;">
                                    <div class="hls ps1"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:-0.18mm;height:3.53mm;width:17.86mm;">
                                        <span class="hrt cs11">용 도</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:115.70mm;top:78.15mm;width:43.58mm;height:51.61mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:24.04mm;">
                                    <div class="hls ps0"
                                        style="line-height:2.79mm;white-space:nowrap;left:0mm;top:-0.18mm;height:3.53mm;width:42.91mm;">
                                        <span class="hrt cs17">&nbsp;&nbsp;</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="hce" style="left:0mm;top:129.76mm;width:159.27mm;height:48.98mm;">
                            <div class="hcD" style="left:0.66mm;top:0mm;">
                                <div class="hcI" style="top:3.82mm;">
                                    <div class="hls ps7"
                                        style="line-height:4.44mm;white-space:nowrap;left:0mm;top:-0.26mm;height:5.29mm;width:158.61mm;">
                                        <span class="hrt cs16">&nbsp;</span><span
                                            class="hrt cs18">&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
                                    <div class="hls ps7"
                                        style="line-height:3.10mm;white-space:nowrap;left:0mm;top:9.33mm;height:3.88mm;width:158.61mm;">
                                        <span class="hrt cs8">&nbsp;&nbsp;&nbsp;&nbsp;발 &nbsp;&nbsp;&nbsp;행
                                            &nbsp;&nbsp;&nbsp;일 :</span>
                                    </div>
                                    <div class="hls ps7"
                                        style="line-height:3.10mm;white-space:nowrap;left:0mm;top:16.32mm;height:3.88mm;width:158.61mm;">
                                        <span class="hrt cs8">&nbsp;&nbsp;&nbsp;&nbsp;의 료 기 관 명 :&nbsp;</span><span
                                            class="hrt cs11">DDIT 의료재단 Medical_TechNology</span></div>
                                    <div class="hls ps7"
                                        style="line-height:3.10mm;white-space:nowrap;left:0mm;top:23.30mm;height:3.88mm;width:158.61mm;">
                                        <span class="hrt cs8">&nbsp;&nbsp;&nbsp;&nbsp;주 소 및 명 칭 :</span><span
                                            class="hrt cs12">&nbsp;</span><span class="hrt cs11">대전시 중구 계룡로 846,
                                            3-4층</span></div>
                                    <div class="hls ps7"
                                        style="line-height:3.10mm;white-space:nowrap;left:0mm;top:30.29mm;height:3.88mm;width:158.61mm;">
                                        <span class="hrt cs8">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="hrt cs11">전 화
                                            : 042 - 222 - 8202 &nbsp;&nbsp;&nbsp;&nbsp;FAX : 070 - 8768 - 2972</span>
                                    </div>
                                    <div class="hls ps7"
                                        style="line-height:3.10mm;white-space:nowrap;left:0mm;top:37.27mm;height:3.88mm;width:158.61mm;">
                                        <span class="hrt cs8">&nbsp;&nbsp;&nbsp;&nbsp;</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hls ps0"
                    style="line-height:3.10mm;white-space:nowrap;left:0mm;top:214.10mm;height:3.88mm;width:189.99mm;">
                </div>
            </div>
        </div>
    </div>
</div>