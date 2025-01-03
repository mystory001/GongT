<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공티 개인정보처리방침</title>
<style>
.page-content {
	padding-bottom: 3.2rem;
	max-width: 740px;
	margin: 0 auto;
}

div {
	display: block;
}

thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}

.page-content table {
	border-collapse: collapse;
	font-size: 1.2rem;
	line-height: 1.6;
	margin: 1.6rem 0;
}

table {
	border-collapse: separate;
	text-indent: initial;
	border-spacing: 2px;
}

body {
	position: relative;
	color: #212529;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	font-weight: 400;
	min-height: 100%;
	-moz-osx-font-smoothing: grayscale;
	-webkit-font-smoothing: antialiased;
}

able {
	display: table;
	border-collapse: separate;
	box-sizing: border-box;
	text-indent: initial;
	border-spacing: 2px;
	border-color: gray;
}

@import
	url(https://d1unjqcospf8gs.cloudfront.net/assets/@karrotmarket/design-token/lib/colors/dark-c7cf6d433b87ca9572c1eafdc506db071f61caba1b453b99b3c7655ae7d44813.css)
	;

@import
	url(https://d1unjqcospf8gs.cloudfront.net/assets/@karrotmarket/design-token/lib/colors/light-c60153a1d293a56134cccb645f6f2c820aec33da60a6f32dbbff909c31f8267b.css)
	;

/* line 63, app/assets/stylesheets/home/theme.scss */
* {
	padding: 0;
	margin: 0;
	outline: none;
}

/* line 69, app/assets/stylesheets/home/theme.scss */
section, article, aside, footer, header, nav, hgroup {
	display: block;
}

/* line 79, app/assets/stylesheets/home/theme.scss */
a {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-touch-callout: none;
	-webkit-tap-highlight-color: rgba(255, 255, 255, 0);
}

/* line 85, app/assets/stylesheets/home/theme.scss */
html {
	font-size: 62.5%;
	height: 100%;
}

/* line 90, app/assets/stylesheets/home/theme.scss */
body {
	position: relative;
	color: #212529;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
	font-weight: 400;
	min-height: 100%;
	-moz-osx-font-smoothing: grayscale;
	-webkit-font-smoothing: antialiased;
}

/* line 100, app/assets/stylesheets/home/theme.scss */
h1, h2, h3, h4, h5, h5 {
	font-weight: 700;
	line-height: 1.5;
}

/* line 110, app/assets/stylesheets/home/theme.scss */
h1 {
	font-size: 2rem;
}

/* line 114, app/assets/stylesheets/home/theme.scss */
h2 {
	font-size: 1.8rem;
}

/* line 118, app/assets/stylesheets/home/theme.scss */
h3 {
	font-size: 1.6rem;
}

/* line 122, app/assets/stylesheets/home/theme.scss */
h4 {
	font-size: 1.4rem;
}

/* line 126, app/assets/stylesheets/home/theme.scss */
h5 {
	font-size: 1.3rem;
}

/* line 130, app/assets/stylesheets/home/theme.scss */
h6 {
	font-size: 1.2rem;
}

/* line 134, app/assets/stylesheets/home/theme.scss */
strong, b {
	font-weight: 700;
}

/* line 139, app/assets/stylesheets/home/theme.scss */
ul {
	list-style-type: disc;
}

/* line 141, app/assets/stylesheets/home/theme.scss */
ul li {
	margin: 1.6rem;
}

/* line 146, app/assets/stylesheets/home/theme.scss */
input, textarea, select, button {
	font-family: inherit;
}

/* line 153, app/assets/stylesheets/home/theme.scss */
textarea {
	font-family: inherit;
	font-size: 1.6rem;
	color: #212529;
	margin: 1.6rem 0;
}

/* line 159, app/assets/stylesheets/home/theme.scss */
textarea.border {
	border: 1px solid #CED4DA;
	border-radius: 6px;
	padding: 1rem 1.4rem;
	margin: 1.6rem 0;
}

/* line 166, app/assets/stylesheets/home/theme.scss */
textarea.width-full {
	display: block;
	width: calc(100% - 1.4rem * 2 - 2px);
}

/* line 172, app/assets/stylesheets/home/theme.scss */
input {
	-webkit-appearance: none;
	border: solid 1px #CED4DA;
	padding: 1rem 1.4rem;
	margin: 1.6rem 0;
	font-size: 1.6rem;
	border-radius: 3px;
}

/* line 180, app/assets/stylesheets/home/theme.scss */
input.input-full, input.width-full {
	display: block;
	width: calc(100% - 1.4rem * 2 - 2px);
}

/* line 186, app/assets/stylesheets/home/theme.scss */
input.width-full.border-none {
	width: 100%;
	padding: 1rem 0;
	margin: 0;
}

/* line 192, app/assets/stylesheets/home/theme.scss */
input.width-full[type=submit] {
	display: block;
	width: 100%;
}

/* line 197, app/assets/stylesheets/home/theme.scss */
input.border-carrot {
	border: 1px solid #FF8A3D;
}

/* line 201, app/assets/stylesheets/home/theme.scss */
input:disabled {
	background-color: #E9ECEF;
	color: #fff;
}

/* line 207, app/assets/stylesheets/home/theme.scss */
button:focus, input:focus, textarea:focus {
	outline: none !important;
	box-shadow: none;
}

/* line 214, app/assets/stylesheets/home/theme.scss */
input::-webkit-input-placeholder {
	color: #CED4DA;
}

/* line 218, app/assets/stylesheets/home/theme.scss */
input:-moz-placeholder {
	color: #CED4DA;
}

/* FF 4-18 */

/* line 223, app/assets/stylesheets/home/theme.scss */
input::-moz-placeholder {
	color: #CED4DA;
}

/* FF 19+ */

/* line 228, app/assets/stylesheets/home/theme.scss */
input:-ms-input-placeholder {
	color: #CED4DA;
}

/* IE 10+ */

/* line 234, app/assets/stylesheets/home/theme.scss */
textarea::-webkit-input-placeholder {
	color: #CED4DA;
}

/* line 238, app/assets/stylesheets/home/theme.scss */
textarea:-moz-placeholder {
	color: #CED4DA;
}

/* FF 4-18 */

/* line 243, app/assets/stylesheets/home/theme.scss */
textarea::-moz-placeholder {
	color: #CED4DA;
}

/* FF 19+ */

/* line 248, app/assets/stylesheets/home/theme.scss */
textarea:-ms-input-placeholder {
	color: #CED4DA;
}

/* IE 10+ */

/* line 254, app/assets/stylesheets/home/theme.scss */
textarea:focus::-webkit-input-placeholder {
	color: #CED4DA;
}

/* line 258, app/assets/stylesheets/home/theme.scss */
textarea:focus:-moz-placeholder {
	color: #CED4DA;
}

/* FF 4-18 */

/* line 263, app/assets/stylesheets/home/theme.scss */
textarea:focus::-moz-placeholder {
	color: #CED4DA;
}

/* FF 19+ */

/* line 268, app/assets/stylesheets/home/theme.scss */
textarea:focus:-ms-input-placeholder {
	color: #CED4DA;
}

/* IE 10+ */

/* line 274, app/assets/stylesheets/home/theme.scss */
button:focus, input:focus, textarea:focus {
	outline: none !important;
	box-shadow: none;
}

/* line 281, app/assets/stylesheets/home/theme.scss */
::-moz-selection {
	color: #212529;
	background: #FFB98B;
}

/* line 285, app/assets/stylesheets/home/theme.scss */
::-moz-selection {
	color: #212529;
	background: #FFB98B;
}

::selection {
	color: #212529;
	background: #FFB98B;
}

/* line 290, app/assets/stylesheets/home/theme.scss */
.clear {
	clear: both;
}

/* line 294, app/assets/stylesheets/home/theme.scss */
.hide {
	text-indent: 100%;
	white-space: nowrap;
	overflow: hidden;
	height: 0;
}

/* line 301, app/assets/stylesheets/home/theme.scss */
.sr-only {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

/* line 312, app/assets/stylesheets/home/theme.scss */
.text-normal {
	font-weight: normal;
}

/* line 316, app/assets/stylesheets/home/theme.scss */
.text-bold {
	font-weight: bold;
}

/* line 320, app/assets/stylesheets/home/theme.scss */
.text-black {
	color: #212529;
}

/* line 324, app/assets/stylesheets/home/theme.scss */
.text-carrot {
	color: #FF8A3D;
}

/* line 328, app/assets/stylesheets/home/theme.scss */
.text-tomato {
	color: #FF3E46;
}

/* line 332, app/assets/stylesheets/home/theme.scss */
.text-green {
	color: #56C271;
}

/* line 336, app/assets/stylesheets/home/theme.scss */
.text-gray {
	color: #868e96;
}

/* line 340, app/assets/stylesheets/home/theme.scss */
.text-light-gray {
	color: #ADB5BD;
}

/* line 344, app/assets/stylesheets/home/theme.scss */
.text-dark-gray {
	color: #495057;
}

/* line 347, app/assets/stylesheets/home/theme.scss */
.text-white {
	color: #fff;
}

/* line 351, app/assets/stylesheets/home/theme.scss */
.text-center {
	text-align: center;
}

/* line 355, app/assets/stylesheets/home/theme.scss */
.text-xxl {
	font-size: 2.4rem !important;
	line-height: 1.54;
	letter-spacing: -0.8px;
}

/* line 361, app/assets/stylesheets/home/theme.scss */
.text-xl {
	font-size: 2rem !important;
	line-height: 1.55;
	letter-spacing: -0.3px;
}

/* line 367, app/assets/stylesheets/home/theme.scss */
.text-l {
	font-size: 1.8rem !important;
	line-height: 1.47;
	letter-spacing: -0.3px;
}

/* line 373, app/assets/stylesheets/home/theme.scss */
.text-m {
	font-size: 1.6rem !important;
	line-height: 1.5;
	letter-spacing: -0.3px;
}

/* line 379, app/assets/stylesheets/home/theme.scss */
.text-s {
	font-size: 1.4rem !important;
	line-height: 1.5;
}

/* line 384, app/assets/stylesheets/home/theme.scss */
.text-xs {
	font-size: 1.3rem !important;
	line-height: 1.5;
}

/* line 389, app/assets/stylesheets/home/theme.scss */
.text-xxs {
	font-size: 1.2rem !important;
	line-height: 1.5;
}

/* line 394, app/assets/stylesheets/home/theme.scss */
.text-no-decoration {
	text-decoration: none;
}

/* line 398, app/assets/stylesheets/home/theme.scss */
.overflow-hidden {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

/* line 404, app/assets/stylesheets/home/theme.scss */
.background-gray {
	background-color: #F8F9FA;
}

/* line 408, app/assets/stylesheets/home/theme.scss */
.background-dark-gray {
	background-color: #E9ECEF;
}

/* line 412, app/assets/stylesheets/home/theme.scss */
.background-white {
	background-color: #fff;
}

/* line 416, app/assets/stylesheets/home/theme.scss */
.background-green {
	background-color: #56C271;
}

/* line 420, app/assets/stylesheets/home/theme.scss */
.background-pale-green {
	background-color: #E6F3E6;
}

/* line 424, app/assets/stylesheets/home/theme.scss */
.circle-image {
	-o-object-fit: cover;
	object-fit: cover;
	border-radius: 50%;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
}

/* line 431, app/assets/stylesheets/home/theme.scss */
.circle-image-s {
	width: 40px;
	height: 40px;
}

/* line 436, app/assets/stylesheets/home/theme.scss */
.circle-image-m {
	width: 48px;
	height: 48px;
}

/* line 441, app/assets/stylesheets/home/theme.scss */
.circle-image-l {
	width: 60px;
	height: 60px;
}

/* line 446, app/assets/stylesheets/home/theme.scss */
.rounded {
	border-radius: 4px;
}

/* line 451, app/assets/stylesheets/home/theme.scss */
.center-image {
	display: flex;
	justify-content: center;
	align-items: center;
}

/* line 455, app/assets/stylesheets/home/theme.scss */
.center-image img {
	width: 100%;
}

/* line 461, app/assets/stylesheets/home/theme.scss */
.image-s img {
	width: 48px;
	height: 48px;
}

/* line 467, app/assets/stylesheets/home/theme.scss */
.article-thumbnail {
	width: 180px;
	height: 180px;
}

/* line 472, app/assets/stylesheets/home/theme.scss */
.article-thumbnail-text {
	width: 180px;
}

/* line 476, app/assets/stylesheets/home/theme.scss */
.inline-block {
	display: inline-block;
	vertical-align: middle;
}

/* line 481, app/assets/stylesheets/home/theme.scss */
.space-between {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

/* line 487, app/assets/stylesheets/home/theme.scss */
.block {
	display: block;
}

/* line 491, app/assets/stylesheets/home/theme.scss */
.flex {
	display: flex;
}

/* line 496, app/assets/stylesheets/home/theme.scss */
.flex-center {
	justify-content: center;
	align-items: center;
}

/* line 501, app/assets/stylesheets/home/theme.scss */
.flex-1 {
	flex: 1;
}

/* line 505, app/assets/stylesheets/home/theme.scss */
.relative {
	position: relative;
}

/* line 509, app/assets/stylesheets/home/theme.scss */
.vertical-top {
	vertical-align: top;
}

/* line 513, app/assets/stylesheets/home/theme.scss */
.vertical-text-top {
	vertical-align: text-top;
}

/* line 517, app/assets/stylesheets/home/theme.scss */
.width-full {
	width: 100%;
}

/* line 521, app/assets/stylesheets/home/theme.scss */
.list-unstyled {
	list-style-type: none;
}

/* line 525, app/assets/stylesheets/home/theme.scss */
.shadow-bottom {
	box-shadow: 0 1px 0 0 #E9ECEF;
}

/* line 529, app/assets/stylesheets/home/theme.scss */
.border-bottom {
	border-bottom: 1px solid #E9ECEF;
}

/* line 533, app/assets/stylesheets/home/theme.scss */
.border-top {
	border-top: 1px solid #E9ECEF;
}

/* line 537, app/assets/stylesheets/home/theme.scss */
.border-none {
	border: none;
}

/* line 541, app/assets/stylesheets/home/theme.scss */
.tag {
	padding: 0.2rem 0.4rem;
	margin-right: 0.2rem;
	margin-top: 0.4rem;
	background-color: #F8F9FA;
	color: #212529;
	font-size: 1.3rem;
}

/* line 550, app/assets/stylesheets/home/theme.scss */
button, .button {
	-webkit-appearance: none;
	border-radius: 6px;
	box-sizing: border-box;
	border: 1px solid #CED4DA;
	color: #212529;
	text-align: center;
	font-weight: 700;
	background-color: #fff;
	margin: 1.6rem 0;
	text-decoration: none;
}

/* line 565, app/assets/stylesheets/home/theme.scss */
button:disabled, .button:disabled {
	background-color: #E9ECEF;
	color: #fff;
	border: none;
}

/* line 572, app/assets/stylesheets/home/theme.scss */
.button-rounded {
	border-radius: 100px;
}

/* line 578, app/assets/stylesheets/home/theme.scss */
.button-s {
	padding: 0.4rem 1rem;
}

/* line 582, app/assets/stylesheets/home/theme.scss */
.button-m {
	padding: 1rem 1.4rem;
	font-size: 1.6rem;
}

/* line 587, app/assets/stylesheets/home/theme.scss */
.button-xl {
	padding: 1.1rem 2rem;
	font-size: 1.8rem;
}

/* line 592, app/assets/stylesheets/home/theme.scss */
.button-full {
	display: block;
	width: 100%;
}

/* line 597, app/assets/stylesheets/home/theme.scss */
.button-carrot {
	background-color: #FF8A3D;
	color: #fff;
	border: 1px solid #FF8A3D;
}

/* line 603, app/assets/stylesheets/home/theme.scss */
.button-tomato {
	background-color: #fff;
	color: #FF3E46;
	border: 1px solid #FF3E46;
}

/* line 609, app/assets/stylesheets/home/theme.scss */
.button-green {
	background-color: #fff;
	color: #56C271;
	border: none;
}

/* line 615, app/assets/stylesheets/home/theme.scss */
.button-dark-gray {
	background-color: #495057;
	color: #fff;
	border: 1px solid #495057;
}

/* line 621, app/assets/stylesheets/home/theme.scss */
.button-black {
	background-color: #fff;
	color: #212529;
	border: 1px solid #212529;
}

/* line 627, app/assets/stylesheets/home/theme.scss */
.button-black:hover {
	border: 1px solid #868e96;
	color: #868e96;
}

/* line 632, app/assets/stylesheets/home/theme.scss */
.right-arrow {
	background: #fff
		url(https://d1unjqcospf8gs.cloudfront.net/assets/wv/smbs/icon-small-rignt-arrow-c84f1abd85c1f283b11c7605514833e464cd93cf5b309c62477ab4a299fc63f0.svg)
		no-repeat right 0 center;
}

/* line 635, app/assets/stylesheets/home/theme.scss */
.right-arrow-disabled {
	background: #fff
		url(https://d1unjqcospf8gs.cloudfront.net/assets/wv/smbs/icon-small-rignt-arrow-disabled-f9761ec61d7893eba985673575d5dfdf56ddcfe1392261e035dd4840c71270c7.svg)
		no-repeat right 0 center;
}

/* line 639, app/assets/stylesheets/home/theme.scss */
.divider-bold {
	border-bottom: 2px solid #212529;
}

/*
m - margin
p - padding
t - margin-top or padding-top
b - margin-bottom or padding-bottom
l - margin-left or padding-left
r - margin-right or padding-right
x - both *-left and *-right
y - both *-top and *-bottom
0 - $spacer * 0
1 - $spacer * .25
2 - $spacer * .5
25 - $spacer * .75
3 - $spacer


4 - $spacer * 1.5


5 - $spacer * 2


auto - auto


*/

/* line 667, app/assets/stylesheets/home/theme.scss */
.m-3 {
	margin: 1.6rem;
}

/* line 669, app/assets/stylesheets/home/theme.scss */
.ml-0_5 {
	margin-left: 0.2rem;
}

/* line 670, app/assets/stylesheets/home/theme.scss */
.ml-1 {
	margin-left: 0.4rem;
}

/* line 671, app/assets/stylesheets/home/theme.scss */
.ml-2 {
	margin-left: 0.8rem;
}

/* line 672, app/assets/stylesheets/home/theme.scss */
.ml-3 {
	margin-left: 1.6rem;
}

/* line 674, app/assets/stylesheets/home/theme.scss */
.mr-2 {
	margin-right: 0.8rem;
}

/* line 676, app/assets/stylesheets/home/theme.scss */
.mt-0 {
	margin-top: 0;
}

/* line 677, app/assets/stylesheets/home/theme.scss */
.mt-0_5 {
	margin-top: 0.2rem;
}

/* line 678, app/assets/stylesheets/home/theme.scss */
.mt-1 {
	margin-top: 0.4rem;
}

/* line 679, app/assets/stylesheets/home/theme.scss */
.mt-2 {
	margin-top: 0.8rem;
}

/* line 680, app/assets/stylesheets/home/theme.scss */
.mt-3 {
	margin-top: 1.6rem;
}

/* line 681, app/assets/stylesheets/home/theme.scss */
.mt-4 {
	margin-top: 2.4rem;
}

/* line 682, app/assets/stylesheets/home/theme.scss */
.mt-5 {
	margin-top: 3.2rem;
}

/* line 684, app/assets/stylesheets/home/theme.scss */
.mb-1 {
	margin-bottom: 0.4rem;
}

/* line 685, app/assets/stylesheets/home/theme.scss */
.mb-2 {
	margin-bottom: 0.8rem;
}

/* line 686, app/assets/stylesheets/home/theme.scss */
.mb-3 {
	margin-bottom: 1.6rem;
}

/* line 687, app/assets/stylesheets/home/theme.scss */
.mb-4 {
	margin-bottom: 2.4rem;
}

/* line 688, app/assets/stylesheets/home/theme.scss */
.mb-5 {
	margin-bottom: 3.2rem;
}

/* line 690, app/assets/stylesheets/home/theme.scss */
.mx-1 {
	margin-left: 0.4rem;
	margin-right: 0.4rem;
}

/* line 694, app/assets/stylesheets/home/theme.scss */
.mx-3 {
	margin-left: 1.6rem;
	margin-right: 1.6rem;
}

/* line 698, app/assets/stylesheets/home/theme.scss */
.mx-4 {
	margin-left: 2.4rem;
	margin-right: 2.4rem;
}

/* line 703, app/assets/stylesheets/home/theme.scss */
.my-1 {
	margin-top: 0.4rem;
	margin-bottom: 0.4rem;
}

/* line 708, app/assets/stylesheets/home/theme.scss */
.my-2 {
	margin-top: 0.8rem;
	margin-bottom: 0.8rem;
}

/* line 713, app/assets/stylesheets/home/theme.scss */
.my-3 {
	margin-top: 1.6rem;
	margin-bottom: 1.6rem;
}

/* line 718, app/assets/stylesheets/home/theme.scss */
.my-4 {
	margin-top: 2.4rem;
	margin-bottom: 2.4rem;
}

/* line 723, app/assets/stylesheets/home/theme.scss */
.my-5 {
	margin-top: 3.2rem;
	margin-bottom: 3.2rem;
}

/* line 728, app/assets/stylesheets/home/theme.scss */
.pt-1 {
	padding-top: 0.4rem;
}

/* line 729, app/assets/stylesheets/home/theme.scss */
.pt-2 {
	padding-top: 0.8rem;
}

/* line 730, app/assets/stylesheets/home/theme.scss */
.pt-3 {
	padding-top: 1.6rem;
}

/* line 731, app/assets/stylesheets/home/theme.scss */
.pt-4 {
	padding-top: 2.4rem;
}

/* line 732, app/assets/stylesheets/home/theme.scss */
.pt-5 {
	padding-top: 3.2rem;
}

/* line 734, app/assets/stylesheets/home/theme.scss */
.pb-2 {
	padding-bottom: 0.8rem;
}

/* line 735, app/assets/stylesheets/home/theme.scss */
.pb-3 {
	padding-bottom: 1.6rem;
}

/* line 736, app/assets/stylesheets/home/theme.scss */
.pb-4 {
	padding-bottom: 2.4rem;
}

/* line 737, app/assets/stylesheets/home/theme.scss */
.pb-5 {
	padding-bottom: 3.2rem;
}

/* line 739, app/assets/stylesheets/home/theme.scss */
.py-1 {
	padding-top: 0.4rem;
	padding-bottom: 0.4rem;
}

/* line 744, app/assets/stylesheets/home/theme.scss */
.py-2 {
	padding-top: 0.8rem;
	padding-bottom: 0.8rem;
}

/* line 749, app/assets/stylesheets/home/theme.scss */
.py-2_5 {
	padding-top: 1.2rem;
	padding-bottom: 1.2rem;
}

/* line 754, app/assets/stylesheets/home/theme.scss */
.py-3 {
	padding-top: 1.6rem;
	padding-bottom: 1.6rem;
}

/* line 759, app/assets/stylesheets/home/theme.scss */
.py-4 {
	padding-top: 2.4rem;
	padding-bottom: 2.4rem;
}

/* line 764, app/assets/stylesheets/home/theme.scss */
.py-5 {
	padding-top: 3.2rem;
	padding-bottom: 3.2rem;
}

/* line 769, app/assets/stylesheets/home/theme.scss */
.px-1 {
	padding-left: 0.4rem;
	padding-right: 0.4rem;
}

/* line 773, app/assets/stylesheets/home/theme.scss */
.px-3 {
	padding-left: 1.6rem;
	padding-right: 1.6rem;
}

/* line 778, app/assets/stylesheets/home/theme.scss */
.p-1 {
	padding: 0.4rem;
}

/* line 780, app/assets/stylesheets/home/theme.scss */
.p-3 {
	padding: 1.6rem;
}

/* line 781, app/assets/stylesheets/home/theme.scss */
.p-4 {
	padding: 2.4rem;
}

/* line 783, app/assets/stylesheets/home/theme.scss */
.mb-0 {
	margin-bottom: 0;
}

/* line 784, app/assets/stylesheets/home/theme.scss */
.pb-0 {
	padding-bottom: 0;
}

/* line 5, app/assets/stylesheets/wv/darkmode.css.scss */
.dark-theme body {
	color: var(- -color-gray900);
	background-color: var(- -color-background);
	-moz-osx-font-smoothing: grayscale;
	-webkit-font-smoothing: antialiased;
}

/* line 13, app/assets/stylesheets/wv/darkmode.css.scss */
.dark-theme .section-svg-icon path, .dark-theme .section-svg-icon rect {
	stroke: var(- -color-background);
}

/* line 19, app/assets/stylesheets/wv/darkmode.css.scss */
.dark-theme .force-darkmode h1, .dark-theme .force-darkmode h2,
	.dark-theme .force-darkmode h3, .dark-theme .force-darkmode h4,
	.dark-theme .force-darkmode h5, .dark-theme .force-darkmode h6,
	.dark-theme .force-darkmode p {
	color: var(- -color-gray900) !important;
}

/* line 4, app/assets/stylesheets/home/policy.scss */
.page-content {
	padding-bottom: 3.2rem;
	max-width: 740px;
	margin: 0 auto;
}

/* line 8, app/assets/stylesheets/home/policy.scss */
.page-content .wrapper {
	margin: 1.6rem;
}

/* line 11, app/assets/stylesheets/home/policy.scss */
.page-content a {
	color: #212529;
	text-decoration: underline;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-touch-callout: none;
	-webkit-tap-highlight-color: rgba(255, 255, 255, 0);
}

/* line 17, app/assets/stylesheets/home/policy.scss */
.dark-theme .page-content a {
	color: var(- -color-blue800);
}

/* line 21, app/assets/stylesheets/home/policy.scss */
.page-content p {
	margin: 1.6rem 0;
	font-size: 1.6rem;
	line-height: 1.6;
}

/* line 26, app/assets/stylesheets/home/policy.scss */
.page-content h1, .page-content h2, .page-content h3, .page-content h4,
	.page-content h5, .page-content h6 {
	margin-top: 3.2rem;
	margin-bottom: 1.6rem;
}

/* line 35, app/assets/stylesheets/home/policy.scss */
.page-content h1 {
	font-size: 2.4rem;
}

/* line 40, app/assets/stylesheets/home/policy.scss */
.page-content ol li, .page-content ul li {
	font-size: 1.6rem;
	margin: 1.2rem 0 1.2rem 2.4rem;
	line-height: 1.6;
}

/* line 44, app/assets/stylesheets/home/policy.scss */
.page-content ol li p, .page-content ul li p {
	margin: 1.6rem 0;
}

/* line 47, app/assets/stylesheets/home/policy.scss */
.page-content ol li::marker, .page-content ul li::marker {
	text-indent: 0.8rem;
}

/* line 52, app/assets/stylesheets/home/policy.scss */
.page-content ol li>ol li {
	list-style-type: lower-alpha;
}

/* line 55, app/assets/stylesheets/home/policy.scss */
.page-content ul li>ul li {
	list-style-type: circle;
}

/* line 58, app/assets/stylesheets/home/policy.scss */
.page-content table {
	border-collapse: collapse;
	font-size: 1.2rem;
	line-height: 1.6;
	margin: 1.6rem 0;
}

/* line 64, app/assets/stylesheets/home/policy.scss */
.page-content table thead th {
	padding: 0.8rem;
	text-align: left;
	vertical-align: middle;
}

/* line 71, app/assets/stylesheets/home/policy.scss */
.page-content table tbody td {
	padding: 0.8rem;
	vertical-align: top;
}

/* line 76, app/assets/stylesheets/home/policy.scss */
.page-content table th, .page-content table td {
	min-width: 8rem;
	border: 1px solid #CED4DA;
}

/* line 82, app/assets/stylesheets/home/policy.scss */
.page-content table ol li, .page-content table ul li {
	font-size: 1.2rem;
}
</style>


<meta charset="UTF-8">


<title>공T 개인정보처리방침</title>


</head>


<body>






	<div class="page-content">


		<div class="wrapper" data-controller="components--darkmode-debugger">


			<h2>공T 개인정보처리방침</h2>






			<p>“주식회사 공T”(이하 “회사” 또는 “공T” 라 함)은 개인정보보호법, 정보통신망 이용촉진 및 정보보호에 관한
				법률, 통신비밀보호법 등 정보통신서비스제공자가 준수하여야 할 관련 법령상의 규정을 준수하며, 관련 법령에 의거한 개인정보
				처리방침을 정하여 이용자의 권익 보호에 최선을 다하고 있습니다. 본 개인정보 처리방침은 회사가 제공하는 서비스 이용에
				적용되고 다음과 같은 내용을 담고 있습니다.</p>






			<h3>01 개인정보 수집 및 이용 현황</h3>






			<p>공T는 원활한 서비스 제공을 위해 다음과 같은 이용자의 개인정보를 처리하고 있습니다.</p>






			<ul>


				<li>수집 및 이용 현황</li>


			</ul>










			<table>


				<thead>


					<tr>


						<th>서비스</th>


						<th>수집 및 이용목적</th>


						<th>구분</th>


						<th>수집 및 이용 항목</th>


						<th>보유 및 이용기간</th>


					</tr>


				</thead>


				<tbody>


					<tr>


						<td rowspan="2">회원 가입</td>


						<td rowspan="2">서비스 이용을 위한 이용자 식별<br>이용자 개별적 통지 및 고지
						</td>


						<td>필수</td>


						<td>휴대폰번호, 위치정보, 닉네임, 관심 카테고리,User ID</td>


						<td rowspan="5">회원탈퇴시 까지<br> <br>※ 단, 관계 법령 위반에 따른
							수사, 조사 등이 진행중인 경우에는 해당 수사, 조사 종료 시 까지 보관 하며 내부규정 혹은 관련법령에 따라 일정기간
							보관됨.
						</td>


					</tr>


					<tr>


						<td>선택</td>


						<td>프로필사진, 이메일</td>


					</tr>


					<tr>


						<td>채팅</td>


						<td>이용자간 채팅 서비스 제공, 매칭 분쟁 조정, 법령이나 이용약관에 반하여 이용자에게 피해를 줄 수 있는
							잘못된 이용행위의 방지</td>


						<td>필수</td>


						<td>앱 내 채팅 기능을 사용한 채팅 내용</td>


					</tr>


					<tr>


						<td>안심번호</td>


						<td>안심번호 서비스 제공</td>


						<td>필수</td>


						<td>안심번호 맵핑정보</td>


					</tr>


					<tr>


						<td>서비스 이용 시 생성되어 수집되는 정보</td>


						<td>이상행위 탐지, 부정이용 방지 및 서비스 개선을 위한 분석, 이용자의 관심, 성향에 기반한개인 맞춤형
							상품추천서비스(광고포함)를 제공</td>


						<td>필수</td>


						<td>검색이력/매칭기록/방문기록 등 서비스이용기록, IP주소, 단말기 정보(OS, 화면사이즈,
							기기식별값,광고ID)</td>


					</tr>


					<tr>


						<td>본인인증</td>


						<td>앱 내 본인인증 서비스 제공</td>


						<td>필수</td>


						<td>이름, CI, DI, 휴대폰번호, 생년월일, 성별, 통신사, 내/외국인 정보</td>


						<td>회원탈퇴시 혹은 동의 철회시 까지<br> <br>※ 단, 관계 법령 위반에 따른
							수사, 조사 등이 진행중인 경우에는 해당 수사, 조사 종료 시 까지 보관 하며 내부규정 혹은 관련법령에 따라 일정기간
							보관됨.
						</td>


					</tr>


					<tr>


						<td>마케팅</td>


						<td>서비스에서 제공하는 혜택, 이벤트, 상품정보, 신규서비스 안내</td>


						<td>선택</td>


						<td>앱 내 알림</td>


						<td>회원탈퇴시 혹은 동의 철회시 까지</td>


					</tr>


					<tr>


						<td rowspan="3">고객문의</td>


						<td rowspan="3">본인확인 및 고객요청사항 처리 및 처리결과에 대한 회신</td>


						<td>필수</td>


						<td>휴대폰번호, 이메일, 상담내역</td>


						<td rowspan="2">3년</td>


					</tr>


					<tr>


						<td rowspan="2">선택</td>


						<td>생년월일, 성명</td>


					</tr>


					<tr>


						<td>신분증사본(주민번호 뒷자리 마스킹처리)</td>


						<td>본인확인 후 즉시파기<br></td>


					</tr>


				</tbody>


			</table>










			<p>공T에서 수집 및 이용되는 개인정보는 다음과 같은 경로로 수집 되고 있습니다.</p>






			<ul>


				<li>개인정보 수집 방법






					<ul>


						<li>회원가입 및 서비스 이용 과정에서 이용자가 개인정보 수집에 대해 동의하고 직접 정보를 입력하는 경우</li>


						<li>제휴 서비스 및 단체로부터 개인정보를 제공받은 경우</li>


						<li>고객센터를 통한 상담과정에서 앱, 메일, 전화, 팩스 등을 통해 개인정보를 수집하는 경우</li>


						<li>서비스 이용과정에서 이용자로부터 수집하는 경우</li>


					</ul>


				</li>


			</ul>










			<p>공T는 원칙적으로 정해진 보유 및 이용기간에 따라 개인정보를 처리하고 있으나, 다음의 정보에 대해서는 아래의
				보존 사유에 의해 명시한 기간 동안 보존합니다.</p>






			<p>(1)회사 내부 방침에 의한 사유</p>






			<table>


				<thead>


					<tr>


						<th>보존항목</th>


						<th>보존사유</th>


						<th>보유기간</th>


					</tr>


				</thead>


				<tbody>


					<tr>


						<td>부정이용기록이있는 사용자의 휴대전화번호, DI, 계좌정보(금융기관명, 계좌번호, 명의자), 기기식별값,
							부정이용기록</td>


						<td>동일인 식별 및 부정이용방지</td>


						<td>5년</td>


					</tr>


					<tr>


						<td>휴대전화번호, 기기식별값, 매칭기록(게시물 및 채팅내용), DI</td>


						<td>동일인 식별 및 중복가입방지, 휴대전화 번호 변경에 따른 탈퇴처리로인한 계정복구요청</td>


						<td>6개월</td>


					</tr>


					<tr>


						<td>매칭기록(게시물 및 채팅 내용)</td>


						<td>매칭 관련 사기 방지 및 분쟁 해결</td>


						<td>5년</td>


					</tr>


				</tbody>


			</table>










			<p>(2)관련법령에 의한 사유</p>






			<table>


				<thead>


					<tr>


						<th>보존항목</th>


						<th>근거법령</th>


						<th>보유기간</th>


					</tr>


				</thead>


				<tbody>


					<tr>


						<td>계약 또는 청약철회 등에 관한 기록</td>


						<td>전자상거래 등에서의 소비자보호에 관한 법률</td>


						<td>5년</td>


					</tr>


					<tr>


						<td>대금결제 및 재화 등의 공급에 관한 기록</td>


						<td>전자상거래 등에서의 소비자보호에 관한 법률</td>


						<td>5년</td>


					</tr>


					<tr>


						<td>소비자의 불만 또는 분쟁처리 기록</td>


						<td>전자상거래 등에서의 소비자보호에 관한 법률</td>


						<td>3년</td>


					</tr>


					<tr>


						<td>표시/광고에 관한 기록</td>


						<td>전자상거래 등에서의 소비자보호에 관한 법률</td>


						<td>6개월</td>


					</tr>


					<tr>


						<td>세법이 규정하는 모든 거래에 관한 장부 및 증빙서류</td>


						<td>국세기본법</td>


						<td>5년</td>


					</tr>


					<tr>


						<td>전자금융 거래에 관한 기록</td>


						<td>전자금융거래법</td>


						<td>5년</td>


					</tr>


					<tr>


						<td>서비스 방문기록</td>


						<td>통신비밀보호법</td>


						<td>3개월</td>


					</tr>


				</tbody>


			</table>










			<h3>02 만 14세 미만 아동의 개인정보 처리</h3>






			<p>공T는 법정대리인의 동의가 필요한 만14세 미만 아동에 대한 정보를 수집 및 이용하지 않습니다.</p>






			<h3>03 개인정보 처리업무의 위탁에 관한 사항</h3>






			<p>공T는 서비스의 원활한 제공을 위해 필요한 때에는 개인정보의 처리를 일부 위탁하고 있으며, 수탁 받은 업체가
				관계 법령을 준수하도록 관리·감독하고 있습니다.</p>






			<table>


				<thead>


					<tr>


						<th>수탁업체</th>


						<th>위탁 업무</th>


					</tr>


				</thead>


				<tbody>


					<tr>


						<td>나이스페이먼츠(주)</td>


						<td>전자 결제 서비스</td>


					</tr>


					<tr>


						<td>(주)공T서비스</td>


						<td>고객센터 운영, 응대, 상담을 위해 활용되는 개인정보</td>


					</tr>


					<tr>


						<td>Amazon Web Services, Inc.</td>


						<td>정보 보관</td>


					</tr>


					<tr>


						<td>Google Cloud Platform</td>


						<td>정보 보관 및 분석</td>


					</tr>


					<tr>


						<td>NHN</td>


						<td>문자, 알림톡 발송</td>


					</tr>


					<tr>


						<td>Infobip ltd.</td>


						<td>문자발송</td>


					</tr>


					<tr>


						<td>(주)모두싸인</td>


						<td>부동산서비스 계약서 생성</td>


					</tr>


					<tr>


						<td>롯데글로벌로지스</td>


						<td>상품배송</td>


					</tr>


					<tr>


						<td>Nice D&amp;R</td>


						<td>차량 관련 정보 확인</td>


					</tr>


					<tr>


						<td>(주)원큐브마케팅</td>


						<td>이벤트 쿠폰 문자 발송</td>


					</tr>


					<tr>


						<td>카히스토리</td>


						<td>사고 내역 조회</td>


					</tr>


					<tr>


						<td>오토업</td>


						<td>차량 정보 조회</td>


					</tr>


				</tbody>


			</table>










			<h3>04 개인정보의 국외 이전에 관한 사항</h3>






			<p>공T는 데이터 분석과 데이터 유실에 대비한 분산 저장을 위해 사용자의 개인정보를 해외 클라우드 서비스에 위탁하고
				있습니다.</p>






			<table style="table-layout: fixed; width: 877px">


				<colgroup>


					<col style="width: 92px">


					<col style="width: 195px">


					<col style="width: 62px">


					<col style="width: 87px">


					<col style="width: 127px">


					<col style="width: 192px">


					<col style="width: 122px">


				</colgroup>


				<thead>


					<tr>


						<th>회사명</th>


						<th>이전목적</th>


						<th>연락처</th>


						<th>개인정보 이전국가</th>


						<th>이전되는 항목</th>


						<th>이전 일시 및 방법</th>


						<th>보유 및 이 용 기간</th>


					</tr>


				</thead>


				<tbody>


					<tr>


						<td>Google Cloud Platform</td>


						<td>Google Cloud Storage에 데이터 저장 및 Google BigQuery를 통한 데이터 분석</td>


						<td>080-822-1422</td>


						<td>미국</td>


						<td>수집하는 모든 개인정보</td>


						<td>데이터 수집 후 수분 이내 Google 클라우드 컴퓨팅 환경에 개인정보 보관</td>


						<td>회원탈퇴 또는 위탁계약 종료시</td>


					</tr>


					<tr>


						<td>Amazon Web Services, Inc</td>


						<td>Simple Storage Service를 이용한 데이터 저장</td>


						<td>82)02-1544-8667</td>


						<td>미국(Amazon Oregon Region)</td>


						<td>수집하는 모든 개인정보</td>


						<td>데이터 수집 후 수분 이내 Amazon 클라우드 컴퓨팅 환경에 개인정보 보관</td>


						<td>회원탈퇴 또는 위탁계약 종료시</td>


					</tr>


				</tbody>


			</table>










			<h3>05 개인정보 제3자 제공에 관한 사항</h3>






			<p>
				공T는 이용자들의 개인정보를 "개인정보의 수집목적 및 이용목적"에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의
				없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는
				예외로 합니다.<br>
			</p>






			<p>
				(1) 이용자의 동의가 있는 경우<br> - 공T 개인정보 제3자 제공 현황<br>
			</p>






			<table style="table-layout: fixed; width: 869px">


				<colgroup>


					<col style="width: 239px">


					<col style="width: 333px">


					<col style="width: 164px">


					<col style="width: 133px">


				</colgroup>


				<thead>


					<tr>


						<th>제공받는자<br></th>


						<th>제공 목적<br></th>


						<th>제공 항목<br></th>


						<th>보유 및 이용기간<br></th>


					</tr>


				</thead>


			</table>










			<p>
				<br> (2) 관련법령에 따른 제공<br> - 회사는 개인정보보호법 등 관계 법령이 정하는 경우, 그
				밖에 정부 관계부처가 합동으로 발표한 「긴급상황 시 개인정보 처리 및 보호수칙」에 따라 재난, 감염병, 급박한 생명·신체
				위험을 초래하는 사건·사고, 급박한 재산 손실 등의 긴급상황이 발생하는 경우, 정보주체의 동의 없이 관계기관에 개인정보를
				제공할 수 있습니다.<br>
			</p>






			<h3>06 개인정보 파기 절차 및 방법</h3>






			<p>
				이용자의 개인정보는 수집 및 이용목적이 달성되면 지체없이 파기합니다.(여기서 ‘이용목적이 달성된 때’란 철회요청,
				서비스계약 만료, 탈퇴 시를 의미.) 다만, 회사 내부 방침 또는 관계 법령에서 정한 보관기간이 있을 경우 일정 기간동안
				보관 후 파기 됩니다.<br> 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기하고, 전자적 파일 형태로
				저장된 기록은 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
			</p>






			<h3>07 장기 미이용 회원에 대한 조치</h3>






			<p>장기 미이용회원은 공T의 서비스를 1년간 이용하지 않은 이용자를 말합니다. 공T는 이 회원의 개인정보를 별도로
				분리 보관 또는 삭제하고 있으며, 분리 보관된 개인정보는 9년간 보관 후 지체없이 파기합니다.</p>






			<h3>08 정보주체와 법정대리인의 권리 의무 및 행사 방법</h3>






			<p>
				이용자는 언제든지 개인정보를 조회하거나 수정할 수 있고 수집/이용에 대한 동의 철회 또는 가입 해지를 요청 할 수
				있습니다.<br> 서비스 내 설정 기능을 통한 변경, 가입해지(동의철회)를 위해서 아래의 경로를 따를 수
				있습니다.
			</p>






			<ul>


				<li>개인정보 조회 : 나의공T &gt; 앱설정 &gt; 계정/정보 관리</li>


				<li>개인정보 변경 : 나의공T &gt; 앱설정 &gt; 계정/정보 관리</li>


				<li>동의철회 : 나의공T &gt; 설정 &gt; 탈퇴하기</li>


			</ul>










			<p>혹은 운영자에게 이메일이나 별도게시판으로 문의주시면 지체없이 조치 해 드리도록 하겠습니다.</p>






			<ul>


				<li>개인정보 관련 고객상담 접수 연락처</li>


				<li>이메일 : privacy@daangnservice.com</li>


				<li>고객센터 문의 : 나의공T &gt; 자주묻는 질문 &gt; 고객센터 문의하기</li>


			</ul>










			<p>
				이용자는 법정대리인이나 위임을 받은 자 등 대리인을 통해서도 권리행사를 하실 수 있으며, 이 경우 『개인정보 처리 방법에
				관한 고시』 별지 제11호 서식에 따른 위임장을 제출하여야 합니다.<br> 개인정보 열람 및 처리정지 요구는
				「개인정보보호법」 제 35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있으며, 개인정보의 정정 및
				삭제 요구 시 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 삭제 해 드릴 수 없습니다.<br>


				공T는 정보주체 권리에 따른 열람의 요구 정정 삭제의 요구 처리정지의 요구 시 요구를 한 이용자가 본인이거나 대리인인지
				확인합니다.
			</p>






			<h3>09 개인정보의 안전성 확보조치에 관한 사항</h3>






			<p>공T는 「개인정보보호법」 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적, 관리적, 물리적 보호대책을
				수립하여 운영하고 있습니다.</p>






			<ul>


				<li>개인정보 취급자의 최소화 및 교육






					<ul>


						<li>개인정보를 처리하는 직원을 최소화 하며, 개인정보를 처리하는 모든 임직원들을 대상으로 개인정보보호
							의무와 보안에 대한 정기적인 교육과 캠페인을 실시</li>


					</ul>


				</li>


				<li>개인정보에 대한 접근 제한






					<ul>


						<li>개인정보를 처리하는 시스템에 대한 접근권한의 부여, 변경, 말소 절차 수립 및 운영</li>


						<li>침입탐지시스템을 이용하여 외부로부터의 무단 접근 통제</li>


					</ul>


				</li>


				<li>접속기록의 보관 및 위변조 방지






					<ul>


						<li>개인정보처리시스템에 접속한 기록(웹 로그, 요약정보 등)을 최소 2년 이상 보관 및 관리</li>


						<li>접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용</li>


					</ul>


				</li>


				<li>개인정보의 암호화






					<ul>


						<li>신용카드 번호 등 중요정보는 암호화 되어 저장 및 관리</li>


						<li>중요한 데이터는 저장 및 전송 시 암호화하여 사용하는 등의 별도 보안기능을 사용</li>


					</ul>


				</li>


				<li>해킹 등에 대비한 기술적 대책






					<ul>


						<li>해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고
							주기적인 갱신·점검</li>


						<li>외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단</li>


						<li>네트워크 트래픽의 통제(Monitoring)는 물론 불법적으로 정보를 변경하는 등의 시도를 탐지</li>


					</ul>


				</li>


			</ul>










			<h3>10 개인정보를 자동으로 수집하는 장치의 설치 운영 및 거부</h3>






			<p>
				공T는 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를
				사용합니다.<br> 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 브라우저에게 보내는 소량의
				정보이며 이용자들의 PC컴퓨터 내의 하드디스크에 저장되기도 합니다.<br> 쿠키는 이용자들이 방문한 공T의 각
				서비스와 웹 사이트 들의 대한 방문 및 이용형태, 인기검색어, 보안접속 여부, 이용자 규모 등을 파악하여 이용자에게 광고를
				포함한 최적화된 맞춤형 정보를 제공하기 위해 사용합니다.<br> 이용자는 쿠키 설치에 대한 선택권을 가지고
				있습니다. 따라서 이용자는 웹 브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을
				거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 일부
				서비스는 이용이 어려움이 있을 수 있습니다.
			</p>






			<p>쿠키 설치 허용 여부를 지정하는 방법</p>






			<ul>


				<li>Internet Explorer






					<ul>


						<li>웹 브라우저 상단의 톱니바퀴 아이콘 선택 &gt; [인터넷 옵션] 선택 &gt; [개인정보 탭] 선택
							&gt; [설정] 에서 [고급] 선택 &gt; [쿠키] 섹션에서 설정</li>


					</ul>


				</li>


				<li>Microsoft Edge






					<ul>


						<li>웹 브라우저 상단의 점 아이콘 선택 &gt; [설정] 선택 &gt; [쿠키 및 사이트 권한] 선택
							&gt; [쿠키 및 사이트 데이트 관리 및 삭제] 선택하여 설정</li>


					</ul>


				</li>


				<li>Chrome






					<ul>


						<li>웹 브라우저 우측 상단의 점 아이콘 선택 &gt; [설정] 선택 &gt; [보안 및 개인정보 보호]
							선택&gt; [쿠키 및 기타 사이트 데이터 &gt; [일반설정] 섹션에서 설정</li>


					</ul>


				</li>


				<li>Whale






					<ul>


						<li>웹 브라우저 상단의 점 아이콘 선택 &gt; [설정] 선택 &gt; [개인정보 보호] 선택 &gt;
							[쿠키 및 기타 사이트 데이터] 선택 &gt; [일반설정] 섹션에서 설정</li>


					</ul>


				</li>


			</ul>










			<h3>11 행태정보 수집 이용 제공 및 거부 등에 관한 사항</h3>






			<p>공T는 서비스 이용과정에서 정보주체에게 최적화된 맞춤형 서비스 및 혜택 온라인 맞춤형 광고 등을 제공하기 위하여
				다음과 같은 행태정보를 수집합니다.</p>






			<table>


				<thead>


					<tr>


						<th>수집하는 행태정보의 항목</th>


						<th>수집방법</th>


						<th>수집 목적</th>


						<th>보유 이용기간 및 정보 처리 방법</th>


					</tr>


				</thead>


				<tbody>


					<tr>


						<td>검색이력/매칭기록/방문기록 등 서비스이용기록, IP주소, 단말기 정보(OS, 화면사이즈, 기기식별값),
							광고ID</td>


						<td>공T 웹/모바일 앱 이용 시 자동 수집</td>


						<td>이용자의 관심, 성향에 기반한개인 맞춤형 상품추천서비스(광고포함)를 제공</td>


						<td>회원탈퇴시 까지<br> <br> <br>※ 단, 관계 법령 위반에 따른
							수사, 조사 등이 진행중인 경우에는 해당 수사, 조사 종료 시 까지 보관 하며 내부규정 혹은 관련법령에 따라 일정기간
							보관됨.
						</td>


					</tr>


				</tbody>


			</table>










			<p>
				공T는 온라인 맞춤형 광고 등에 필요한 최소한의 행태정보만을 수집하며, 사상, 신념, 가족 및 친인척관계, 학력 병력,
				기타 사회활동 경력 등 개인의 권리 이익이나 사생활을 뚜렷하게 침해할 우려가 있는 민감한 행태정보를 수집하지 않습니다.<br>


				공T는 모바일 앱에서 온라인 맞춤형 광고를 위하여 광고식별자를 수집/이용 합니다. 정보주체는 아래와 같이 모바일 단말기의
				설정 변경을 통해 앱의 맞춤형 광고를 차단허용 할 수 있습니다.
			</p>






			<ul>


				<li>안드로이드 단말기






					<ul>


						<li>설정 &gt; 개인정보보호 &gt; 광고 ID재설정 또는 광고ID 삭제</li>


					</ul>


				</li>


				<li>아이폰 단말기






					<ul>


						<li>설정 &gt; 개인정보보호 &gt; 추적 &gt; 앱이 추적을 요청하도록 허용 끔</li>


					</ul>


				</li>


				<li>앱 내 설정






					<ul>


						<li>나의공T &gt; 설정(우측 상단 톱니바퀴모양) &gt; 기타설정 &gt; 맞춤형 광고 허용하기 끔</li>


					</ul>


				</li>


			</ul>










			<h3>12 개인정보 보호책임자에 관한 사항</h3>






			<p>
				사용자가 서비스를 이용하면서 발생하는 모든 개인정보보호 관련 문의, 불만, 조언이나 기타 사항은 개인정보 보호책임자 및
				담당부서로 연락해 주시기 바랍니다. 공T는 사용자 목소리에 귀 기울이고 신속하고 충분한 답변을 드릴 수 있도록 최선을
				다하겠습니다<br> <br> - 이름 : 이동현<br> - 직위 : 개인정보보호책임자<br>
				- 부서 : 보안팀<br> - 연락처 : privacy@daangnservice.com<br>
			</p>






			<h3>13 정보주체의 권익침해에 대한 구제방법</h3>






			<p>
				이용자는 아래의 기관에 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다<br> - 개인정보
				침해신고센터 (한국인터넷진흥원 운영)<br> - 소관업무 : 개인정보 침해사실 신고, 상담 신청<br>


				- 홈페이지 : privacy.kisa.or.kr<br> - 전화 : (국번없이) 118<br> - 주소
				: 전라남도 나주시 진흥길 9 한국인터넷진흥원<br> - 개인정보 분쟁조정위원회<br> - 소관업무 :
				개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)<br> - 홈페이지 : www.kopico.go.kr<br>


				- 전화 : 1833-6972<br> - 주소 : 서울특별시 종로구 세종대로 209 정부서울청사 12층<br>


				- 대검찰청 사이버수사과: (국번없이) 1301, privacy@spo.go.kr (www.spo.go.kr)<br>


				- 경찰청 사이버수사국: (국번없이) 182 (ecrm.cyber.go.kr)<br>
			</p>






			<p>
				공T는 정보주체의 개인정보자기결정권을 보장하고, 개인정보침해로 인한 상담 및 피해구제를 위해 노력하고 있으며, 신고나
				상담이 필요한 경우 개인정보관련 고객상담 접수 부서 (08 정보주체와 법정대리인의 권리 의무 및 행사 방법 참고) 로 연락
				해 주시기 바랍니다.<br> 『개인정보보호법』 제25조(개인정보의 열람), 제26조(개인정보의 정정 삭제),
				제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는
				이익의 침해를 받은 자는 행정심판법이 정하는 바에따라 행정심판을 청구할 수 있습니다.
			</p>






			<h3>14 개인정보처리방침의 시행 및 변경에 관한 사항</h3>






			<p>
				이 개인정보 처리방침은 2023년 3월 20일부터 시행되며 공T는 법률이나 서비스의 변경사항을 반영하기 위한 목적 등으로
				개인정보처리방침이 변경되는 경우 최소 7일 전부터 공지사항을 통해 변경 사항을 고지 해드리도록 하겠습니다. <br>


				이전개인정보처리방침은 아래에서 확인 하실 수 있습니다. <br> <a
					href="https://www.daangn.com/policy/previous_privacy">이전
					개인정보처리방침(시행일자-23.01.19)</a>
			</p>






		</div>


	</div>


</body>


</html>


