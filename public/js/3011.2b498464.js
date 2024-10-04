"use strict";(self["webpackChunkiHRIS_v5"]=self["webpackChunkiHRIS_v5"]||[]).push([[3011],{55533:function(e,t,r){r.d(t,{Z:function(){return s}});var i=r(48085),a=r(73325),s=(0,a.Z)(i.Z).extend({name:"v-subheader",props:{inset:Boolean},render(e){return e("div",{staticClass:"v-subheader",class:{"v-subheader--inset":this.inset,...this.themeClasses},attrs:this.$attrs,on:this.$listeners},this.$slots.default)}})},50397:function(e,t,r){r.r(t),r.d(t,{default:function(){return b}});var i=function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("v-container",{staticClass:"py-5"},[r("v-card",[r("v-card-title",[e._v(" Search Student Record "),r("v-spacer")],1),r("v-card-title",[r("v-text-field",{staticClass:"ma-2",attrs:{label:"Name",dense:"",outlined:"","hide-details":"",clearable:""},on:{change:function(t){return e.buildTerms()},"click:clear":function(t){return e.clearSearch("name")}},model:{value:e.search.name,callback:function(t){e.$set(e.search,"name",t)},expression:"search.name"}}),r("v-text-field",{staticClass:"ma-2",attrs:{label:"Registration Number",dense:"",outlined:"","hide-details":"",clearable:""},on:{change:function(t){return e.buildTerms()},"click:clear":function(t){return e.clearSearch("regnumber")}},model:{value:e.search.regnumber,callback:function(t){e.$set(e.search,"regnumber",t)},expression:"search.regnumber"}}),r("v-select",{staticClass:"ma-2",attrs:{label:"Gender",dense:"",outlined:"","hide-details":"",clearable:"",items:e.gender,"item-text":"display","item-value":"code"},on:{change:function(t){return e.buildTerms()},"click:clear":function(t){return e.clearSearch("gender")}},model:{value:e.search.gender,callback:function(t){e.$set(e.search,"gender",t)},expression:"search.gender"}}),r("v-select",{staticClass:"ma-2",attrs:{label:"Units",dense:"",outlined:"","hide-details":"",clearable:"",items:e.units,"item-text":"display","item-value":"code"},on:{change:function(t){return e.buildTerms()},"click:clear":function(t){return e.clearSearch("unit")}},model:{value:e.search.unit,callback:function(t){e.$set(e.search,"unit",t)},expression:"search.unit"}})],1),e.error_message?r("v-card-subtitle",{staticClass:"white--text error"},[e._v(e._s(e.error_message))]):e._e(),r("v-card-text",[r("v-data-table",{staticClass:"elevation-1",staticStyle:{cursor:"pointer"},attrs:{headers:e.headers,items:e.results,"item-key":"id",options:e.options,"server-items-length":e.total,"footer-props":{"items-per-page-text":e.$t("App.hardcoded-texts.tableText"),"items-per-page-options":[5,10,20,50]},loading:e.loading},on:{"update:options":function(t){e.options=t},"click:row":e.clickIt}})],1)],1)],1)},a=[],s={name:"ihris-search",data:function(){return{search:{name:"",regnumber:"",gender:"",unit:""},gender:[],units:[],debug:"",terms:{},headers:[{text:"Surname",value:"surname"},{text:"First Name(s)",value:"given"},{text:"Date of Birth",value:"birthDate"},{text:"Gender",value:"gender"},{text:"Registration Number",value:"regnumber"},{text:"Unit",value:"unit"}],results:[],options:{itemsPerPage:10},loading:!1,total:0,prevPage:-1,link:[],error_message:null,update_again:{rerun:!1,restart:!1}}},watch:{options:{handler(){this.getData()},deep:!0}},mounted:function(){this.getData(!0),this.getTermsData()},methods:{clearSearch:function(e){this.search[e]="",this.buildTerms()},clickIt:function(e){this.$router.push({name:"resource_view",params:{page:"student",id:e.id}})},checkRerun(){!this.loading&&this.update_again.rerun&&(this.getData(this.update_again.restart),this.update_again={rerun:!1,restart:!1})},async buildTerms(){this.terms={},this.search.name&&(this.terms["name:contains"]=this.search.name),this.search.gender&&(this.terms.gender=this.search.gender),this.search.unit?this.getDataRole():this.getData(!0)},getDataRole(){return new Promise(((e,t)=>{let r="/fhir/PractitionerRole?_include=PractitionerRole:practitioner&_sort=-_lastUpdated&unit="+this.search.unit;fetch(r).then((r=>{r.json().then((async t=>{this.populateTable(t),e()})).catch((()=>{t()}))})).catch((()=>{t()}))}))},getData(e){if(this.loading)return this.update_again.rerun=!0,void(this.update_again.restart=this.update_again.restart||e);this.loading=!0,this.error_message=null;let t="";if(e&&(this.options.page=1),this.options.page>1&&(this.options.page===this.prevPage-1?t=this.link.find((e=>"previous"===e.relation)).url:this.options.page===this.prevPage+1&&(t=this.link.find((e=>"next"===e.relation)).url),t=t.replace(/_getpages=[^&]*&*/,"").replace("/fhir?","/fhir/Practitioner?"),t=t.substring(t.indexOf("/fhir/")),-1===t.indexOf("_revinclude=PractitionerRole:practitioner")&&(t+="&_revinclude=PractitionerRole:practitioner"),-1===t.indexOf("_sort=-_lastUpdated")&&(t+="&_sort=-_lastUpdated"),-1===t.indexOf("_total=accurate")&&(t+="&_total=accurate")),""===t){let e=this.options.itemsPerPage||10,r="";for(let t in this.options.sortBy)r&&(r+=","),this.options.sortDesc[t]&&(r+="-"),r+=this.options.sortBy[t];t="/fhir/Practitioner?_count="+e+"&_revinclude=PractitionerRole:practitioner&_sort=-_lastUpdated&_total=accurate",this.debug=t}let r=Object.keys(this.terms);for(let i of r)Array.isArray(this.terms[i])?this.terms[i].length>0&&(t+="&"+i+"="+this.terms[i].join(",")):this.terms[i]&&(t+="&"+i+"="+this.terms[i]);this.prevPage=this.options.page,fetch(t).then((e=>{e.json().then((async e=>{e.total>0&&(this.link=e.link,this.populateTable(e)),this.total=e.total,this.loading=!1,this.checkRerun()})).catch((e=>{this.loading=!1,this.error_message="Unable to load results.",this.checkRerun(),console.log(e)}))})).catch((e=>{this.loading=!1,this.error_message="Unable to load results.",this.checkRerun(),console.log(e)}))},async populateTable(e){this.results=[];for(let t of e.entry){if("Practitioner"!==t.resource.resourceType)continue;let r={id:t.resource.id};r.surname=t.resource.name[0].family,r.given=t.resource.name[0].given.join(", "),r.birthDate=t.resource.birthDate,r.gender=t.resource.gender,r.gender=await this.$fhirutils.lookup(r.gender,"http://hl7.org/fhir/administrative-gender"),r.regnumber=t.resource.extension.find((e=>"http://ihris.org/fhir/StructureDefinition/registration-number"===e.url)).valueString;let i=e.entry.find((e=>"PractitionerRole"===e.resource.resourceType&&e.resource.practitioner.reference==="Practitioner/"+t.resource.id)),a=i.resource.extension.find((e=>"http://ihris.org/fhir/StructureDefinition/itsf-maahad-unit"===e.url));r.unit=a.valueCoding.display,this.results.push(r)}},getTermsData(){this.$fhirutils.expand("http://ihris.org/fhir/ValueSet/itsf-gender-valueset").then((e=>{this.gender=e})),this.$fhirutils.expand("http://ihris.org/fhir/ValueSet/itsf-maahad-unit-valueset").then((e=>{this.units=e}))}}},n=s,l=r(43736),o=r(43453),c=r.n(o),u=r(32371),h=r(37118),d=r(4228),g=r(40865),p=r(43986),m=r(99762),f=r(55978),v=(0,l.Z)(n,i,a,!1,null,null,null),b=v.exports;c()(v,{VCard:u.Z,VCardSubtitle:h.Qq,VCardText:h.ZB,VCardTitle:h.EB,VContainer:d.Z,VDataTable:g.Z,VSelect:p.Z,VSpacer:m.Z,VTextField:f.Z})}}]);
//# sourceMappingURL=3011.2b498464.js.map