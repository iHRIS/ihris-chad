"use strict";(self["webpackChunkiHRIS_v5"]=self["webpackChunkiHRIS_v5"]||[]).push([[9057],{69057:function(t,e,a){a.r(e),a.d(e,{default:function(){return l}});var n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return t.objURL?a("div",[t.isImage?a("v-img",{attrs:{src:t.objURL}}):a("a",{attrs:{download:t.data.title,href:t.objURL}},[t._v(t._s(t.data.title))])],1):t._e()},s=[],o={props:["data","code"],data:function(){return{objURL:""}},computed:{isImage:function(){return this.data.contentType&&this.data.contentType.startsWith("image/")},attachmentCode:function(){return this.code}},methods:{setObjectURL(){if(this.data.data&&this.data.contentType){let t="data:"+this.data.contentType+";base64,"+this.data.data;fetch(t).then((t=>t.blob())).then((t=>this.objURL=URL.createObjectURL(t))).catch((t=>{console.log("Failed to get data from base64.",t)}))}}},created(){this.setObjectURL()}},c=o,i=a(43736),d=a(43453),r=a.n(d),h=a(97047),u=(0,i.Z)(c,n,s,!1,null,null,null),l=u.exports;r()(u,{VImg:h.Z})}}]);
//# sourceMappingURL=9057.39bb1d48.js.map