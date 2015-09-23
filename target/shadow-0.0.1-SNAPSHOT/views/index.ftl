<#ftl encoding='UTF-8'>
<@layout.basic title="<li><a  href=''>Strona główna</a></li>" path="./">
<script src="script/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="script/s3Slider.js" type="text/javascript"></script>
<link rel="stylesheet" href="styles/slider.css" />

<style>
.gradient3{
background: #d7e1e3;
}
</style>

<div class="gradient3">
	<h1><span></span>Witamy na stronie głównej Kapital Portal !</h1>
</div>


<table>
<tr>
<td>
<div id="s3slider">
    <ul id="s3sliderContent">
        <li class="s3sliderImage">
            <img src="images/1n.jpg">
            <span>Your text comes here</span>
        </li>
        <li class="s3sliderImage">
            <img src="images/2n.jpg">
            <span>
            Your text comes here
            </span>
        </li>
        <li class="s3sliderImage">
            <img src="images/3n.jpg">
            <span>Your text comes here</span>
        </li>
        <div class="clear s3sliderImage"></div>
    </ul>
</div>
</td>
<td>
<img src="images/line.jpg" style="margin-top: -100px;" />
</td>
<td>
<p style="font-size:16px;font-style:italic;margin-top: -100px;">
Program komputerowy służący do wspomagania zarządzaniem - Capital.
Przeznaczony jest dla małych i średnich przedsiębiorstw, ze szczególnym
uwzględnieniem potrzeb branży budowlanej i zarządców nieruchomości.
Aplikacja zapewnia obsługę wszystkich istotnych procesów zachodzących w firmie.
</p>
</td>
</tr>
</table>




<script>
$(document).ready(function() { 
    $('#s3slider').s3Slider({
        timeOut: 4000
    });
});
</script>

</@layout.basic>
