(self["webpackChunkiHRIS_v5"]=self["webpackChunkiHRIS_v5"]||[]).push([[6049],{48764:function(t,e,r){"use strict";var i=r(79742),n=r(80645),o="function"===typeof Symbol&&"function"===typeof Symbol["for"]?Symbol["for"]("nodejs.util.inspect.custom"):null;
/*!
 * The buffer module from node.js, for the browser.
 *
 * @author   Feross Aboukhadijeh <https://feross.org>
 * @license  MIT
 */e.lW=h,e.h2=50;var s=2147483647;function a(){try{var t=new Uint8Array(1),e={foo:function(){return 42}};return Object.setPrototypeOf(e,Uint8Array.prototype),Object.setPrototypeOf(t,e),42===t.foo()}catch(r){return!1}}function u(t){if(t>s)throw new RangeError('The value "'+t+'" is invalid for option "size"');var e=new Uint8Array(t);return Object.setPrototypeOf(e,h.prototype),e}function h(t,e,r){if("number"===typeof t){if("string"===typeof e)throw new TypeError('The "string" argument must be of type string. Received type number');return c(t)}return l(t,e,r)}function l(t,e,r){if("string"===typeof t)return y(t,e);if(ArrayBuffer.isView(t))return g(t);if(null==t)throw new TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type "+typeof t);if(X(t,ArrayBuffer)||t&&X(t.buffer,ArrayBuffer))return v(t,e,r);if("undefined"!==typeof SharedArrayBuffer&&(X(t,SharedArrayBuffer)||t&&X(t.buffer,SharedArrayBuffer)))return v(t,e,r);if("number"===typeof t)throw new TypeError('The "value" argument must not be of type number. Received type number');var i=t.valueOf&&t.valueOf();if(null!=i&&i!==t)return h.from(i,e,r);var n=m(t);if(n)return n;if("undefined"!==typeof Symbol&&null!=Symbol.toPrimitive&&"function"===typeof t[Symbol.toPrimitive])return h.from(t[Symbol.toPrimitive]("string"),e,r);throw new TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type "+typeof t)}function f(t){if("number"!==typeof t)throw new TypeError('"size" argument must be of type number');if(t<0)throw new RangeError('The value "'+t+'" is invalid for option "size"')}function p(t,e,r){return f(t),t<=0?u(t):void 0!==e?"string"===typeof r?u(t).fill(e,r):u(t).fill(e):u(t)}function c(t){return f(t),u(t<0?0:0|w(t))}function y(t,e){if("string"===typeof e&&""!==e||(e="utf8"),!h.isEncoding(e))throw new TypeError("Unknown encoding: "+e);var r=0|E(t,e),i=u(r),n=i.write(t,e);return n!==r&&(i=i.slice(0,n)),i}function d(t){for(var e=t.length<0?0:0|w(t.length),r=u(e),i=0;i<e;i+=1)r[i]=255&t[i];return r}function g(t){if(X(t,Uint8Array)){var e=new Uint8Array(t);return v(e.buffer,e.byteOffset,e.byteLength)}return d(t)}function v(t,e,r){if(e<0||t.byteLength<e)throw new RangeError('"offset" is outside of buffer bounds');if(t.byteLength<e+(r||0))throw new RangeError('"length" is outside of buffer bounds');var i;return i=void 0===e&&void 0===r?new Uint8Array(t):void 0===r?new Uint8Array(t,e):new Uint8Array(t,e,r),Object.setPrototypeOf(i,h.prototype),i}function m(t){if(h.isBuffer(t)){var e=0|w(t.length),r=u(e);return 0===r.length||t.copy(r,0,0,e),r}return void 0!==t.length?"number"!==typeof t.length||J(t.length)?u(0):d(t):"Buffer"===t.type&&Array.isArray(t.data)?d(t.data):void 0}function w(t){if(t>=s)throw new RangeError("Attempt to allocate Buffer larger than maximum size: 0x"+s.toString(16)+" bytes");return 0|t}function b(t){return+t!=t&&(t=0),h.alloc(+t)}function E(t,e){if(h.isBuffer(t))return t.length;if(ArrayBuffer.isView(t)||X(t,ArrayBuffer))return t.byteLength;if("string"!==typeof t)throw new TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type '+typeof t);var r=t.length,i=arguments.length>2&&!0===arguments[2];if(!i&&0===r)return 0;for(var n=!1;;)switch(e){case"ascii":case"latin1":case"binary":return r;case"utf8":case"utf-8":return q(t).length;case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return 2*r;case"hex":return r>>>1;case"base64":return G(t).length;default:if(n)return i?-1:q(t).length;e=(""+e).toLowerCase(),n=!0}}function B(t,e,r){var i=!1;if((void 0===e||e<0)&&(e=0),e>this.length)return"";if((void 0===r||r>this.length)&&(r=this.length),r<=0)return"";if(r>>>=0,e>>>=0,r<=e)return"";t||(t="utf8");while(1)switch(t){case"hex":return P(this,e,r);case"utf8":case"utf-8":return C(this,e,r);case"ascii":return V(this,e,r);case"latin1":case"binary":return $(this,e,r);case"base64":return k(this,e,r);case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return j(this,e,r);default:if(i)throw new TypeError("Unknown encoding: "+t);t=(t+"").toLowerCase(),i=!0}}function U(t,e,r){var i=t[e];t[e]=t[r],t[r]=i}function A(t,e,r,i,n){if(0===t.length)return-1;if("string"===typeof r?(i=r,r=0):r>2147483647?r=2147483647:r<-2147483648&&(r=-2147483648),r=+r,J(r)&&(r=n?0:t.length-1),r<0&&(r=t.length+r),r>=t.length){if(n)return-1;r=t.length-1}else if(r<0){if(!n)return-1;r=0}if("string"===typeof e&&(e=h.from(e,i)),h.isBuffer(e))return 0===e.length?-1:S(t,e,r,i,n);if("number"===typeof e)return e&=255,"function"===typeof Uint8Array.prototype.indexOf?n?Uint8Array.prototype.indexOf.call(t,e,r):Uint8Array.prototype.lastIndexOf.call(t,e,r):S(t,[e],r,i,n);throw new TypeError("val must be string, number or Buffer")}function S(t,e,r,i,n){var o,s=1,a=t.length,u=e.length;if(void 0!==i&&(i=String(i).toLowerCase(),"ucs2"===i||"ucs-2"===i||"utf16le"===i||"utf-16le"===i)){if(t.length<2||e.length<2)return-1;s=2,a/=2,u/=2,r/=2}function h(t,e){return 1===s?t[e]:t.readUInt16BE(e*s)}if(n){var l=-1;for(o=r;o<a;o++)if(h(t,o)===h(e,-1===l?0:o-l)){if(-1===l&&(l=o),o-l+1===u)return l*s}else-1!==l&&(o-=o-l),l=-1}else for(r+u>a&&(r=a-u),o=r;o>=0;o--){for(var f=!0,p=0;p<u;p++)if(h(t,o+p)!==h(e,p)){f=!1;break}if(f)return o}return-1}function x(t,e,r,i){r=Number(r)||0;var n=t.length-r;i?(i=Number(i),i>n&&(i=n)):i=n;var o=e.length;i>o/2&&(i=o/2);for(var s=0;s<i;++s){var a=parseInt(e.substr(2*s,2),16);if(J(a))return s;t[r+s]=a}return s}function I(t,e,r,i){return H(q(e,t.length-r),t,r,i)}function L(t,e,r,i){return H(Y(e),t,r,i)}function R(t,e,r,i){return H(G(e),t,r,i)}function T(t,e,r,i){return H(K(e,t.length-r),t,r,i)}function k(t,e,r){return 0===e&&r===t.length?i.fromByteArray(t):i.fromByteArray(t.slice(e,r))}function C(t,e,r){r=Math.min(t.length,r);var i=[],n=e;while(n<r){var o,s,a,u,h=t[n],l=null,f=h>239?4:h>223?3:h>191?2:1;if(n+f<=r)switch(f){case 1:h<128&&(l=h);break;case 2:o=t[n+1],128===(192&o)&&(u=(31&h)<<6|63&o,u>127&&(l=u));break;case 3:o=t[n+1],s=t[n+2],128===(192&o)&&128===(192&s)&&(u=(15&h)<<12|(63&o)<<6|63&s,u>2047&&(u<55296||u>57343)&&(l=u));break;case 4:o=t[n+1],s=t[n+2],a=t[n+3],128===(192&o)&&128===(192&s)&&128===(192&a)&&(u=(15&h)<<18|(63&o)<<12|(63&s)<<6|63&a,u>65535&&u<1114112&&(l=u))}null===l?(l=65533,f=1):l>65535&&(l-=65536,i.push(l>>>10&1023|55296),l=56320|1023&l),i.push(l),n+=f}return _(i)}h.TYPED_ARRAY_SUPPORT=a(),h.TYPED_ARRAY_SUPPORT||"undefined"===typeof console||"function"!==typeof console.error||console.error("This browser lacks typed array (Uint8Array) support which is required by `buffer` v5.x. Use `buffer` v4.x if you require old browser support."),Object.defineProperty(h.prototype,"parent",{enumerable:!0,get:function(){if(h.isBuffer(this))return this.buffer}}),Object.defineProperty(h.prototype,"offset",{enumerable:!0,get:function(){if(h.isBuffer(this))return this.byteOffset}}),h.poolSize=8192,h.from=function(t,e,r){return l(t,e,r)},Object.setPrototypeOf(h.prototype,Uint8Array.prototype),Object.setPrototypeOf(h,Uint8Array),h.alloc=function(t,e,r){return p(t,e,r)},h.allocUnsafe=function(t){return c(t)},h.allocUnsafeSlow=function(t){return c(t)},h.isBuffer=function(t){return null!=t&&!0===t._isBuffer&&t!==h.prototype},h.compare=function(t,e){if(X(t,Uint8Array)&&(t=h.from(t,t.offset,t.byteLength)),X(e,Uint8Array)&&(e=h.from(e,e.offset,e.byteLength)),!h.isBuffer(t)||!h.isBuffer(e))throw new TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');if(t===e)return 0;for(var r=t.length,i=e.length,n=0,o=Math.min(r,i);n<o;++n)if(t[n]!==e[n]){r=t[n],i=e[n];break}return r<i?-1:i<r?1:0},h.isEncoding=function(t){switch(String(t).toLowerCase()){case"hex":case"utf8":case"utf-8":case"ascii":case"latin1":case"binary":case"base64":case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return!0;default:return!1}},h.concat=function(t,e){if(!Array.isArray(t))throw new TypeError('"list" argument must be an Array of Buffers');if(0===t.length)return h.alloc(0);var r;if(void 0===e)for(e=0,r=0;r<t.length;++r)e+=t[r].length;var i=h.allocUnsafe(e),n=0;for(r=0;r<t.length;++r){var o=t[r];if(X(o,Uint8Array))n+o.length>i.length?h.from(o).copy(i,n):Uint8Array.prototype.set.call(i,o,n);else{if(!h.isBuffer(o))throw new TypeError('"list" argument must be an Array of Buffers');o.copy(i,n)}n+=o.length}return i},h.byteLength=E,h.prototype._isBuffer=!0,h.prototype.swap16=function(){var t=this.length;if(t%2!==0)throw new RangeError("Buffer size must be a multiple of 16-bits");for(var e=0;e<t;e+=2)U(this,e,e+1);return this},h.prototype.swap32=function(){var t=this.length;if(t%4!==0)throw new RangeError("Buffer size must be a multiple of 32-bits");for(var e=0;e<t;e+=4)U(this,e,e+3),U(this,e+1,e+2);return this},h.prototype.swap64=function(){var t=this.length;if(t%8!==0)throw new RangeError("Buffer size must be a multiple of 64-bits");for(var e=0;e<t;e+=8)U(this,e,e+7),U(this,e+1,e+6),U(this,e+2,e+5),U(this,e+3,e+4);return this},h.prototype.toString=function(){var t=this.length;return 0===t?"":0===arguments.length?C(this,0,t):B.apply(this,arguments)},h.prototype.toLocaleString=h.prototype.toString,h.prototype.equals=function(t){if(!h.isBuffer(t))throw new TypeError("Argument must be a Buffer");return this===t||0===h.compare(this,t)},h.prototype.inspect=function(){var t="",r=e.h2;return t=this.toString("hex",0,r).replace(/(.{2})/g,"$1 ").trim(),this.length>r&&(t+=" ... "),"<Buffer "+t+">"},o&&(h.prototype[o]=h.prototype.inspect),h.prototype.compare=function(t,e,r,i,n){if(X(t,Uint8Array)&&(t=h.from(t,t.offset,t.byteLength)),!h.isBuffer(t))throw new TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type '+typeof t);if(void 0===e&&(e=0),void 0===r&&(r=t?t.length:0),void 0===i&&(i=0),void 0===n&&(n=this.length),e<0||r>t.length||i<0||n>this.length)throw new RangeError("out of range index");if(i>=n&&e>=r)return 0;if(i>=n)return-1;if(e>=r)return 1;if(e>>>=0,r>>>=0,i>>>=0,n>>>=0,this===t)return 0;for(var o=n-i,s=r-e,a=Math.min(o,s),u=this.slice(i,n),l=t.slice(e,r),f=0;f<a;++f)if(u[f]!==l[f]){o=u[f],s=l[f];break}return o<s?-1:s<o?1:0},h.prototype.includes=function(t,e,r){return-1!==this.indexOf(t,e,r)},h.prototype.indexOf=function(t,e,r){return A(this,t,e,r,!0)},h.prototype.lastIndexOf=function(t,e,r){return A(this,t,e,r,!1)},h.prototype.write=function(t,e,r,i){if(void 0===e)i="utf8",r=this.length,e=0;else if(void 0===r&&"string"===typeof e)i=e,r=this.length,e=0;else{if(!isFinite(e))throw new Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");e>>>=0,isFinite(r)?(r>>>=0,void 0===i&&(i="utf8")):(i=r,r=void 0)}var n=this.length-e;if((void 0===r||r>n)&&(r=n),t.length>0&&(r<0||e<0)||e>this.length)throw new RangeError("Attempt to write outside buffer bounds");i||(i="utf8");for(var o=!1;;)switch(i){case"hex":return x(this,t,e,r);case"utf8":case"utf-8":return I(this,t,e,r);case"ascii":case"latin1":case"binary":return L(this,t,e,r);case"base64":return R(this,t,e,r);case"ucs2":case"ucs-2":case"utf16le":case"utf-16le":return T(this,t,e,r);default:if(o)throw new TypeError("Unknown encoding: "+i);i=(""+i).toLowerCase(),o=!0}},h.prototype.toJSON=function(){return{type:"Buffer",data:Array.prototype.slice.call(this._arr||this,0)}};var O=4096;function _(t){var e=t.length;if(e<=O)return String.fromCharCode.apply(String,t);var r="",i=0;while(i<e)r+=String.fromCharCode.apply(String,t.slice(i,i+=O));return r}function V(t,e,r){var i="";r=Math.min(t.length,r);for(var n=e;n<r;++n)i+=String.fromCharCode(127&t[n]);return i}function $(t,e,r){var i="";r=Math.min(t.length,r);for(var n=e;n<r;++n)i+=String.fromCharCode(t[n]);return i}function P(t,e,r){var i=t.length;(!e||e<0)&&(e=0),(!r||r<0||r>i)&&(r=i);for(var n="",o=e;o<r;++o)n+=Q[t[o]];return n}function j(t,e,r){for(var i=t.slice(e,r),n="",o=0;o<i.length-1;o+=2)n+=String.fromCharCode(i[o]+256*i[o+1]);return n}function z(t,e,r){if(t%1!==0||t<0)throw new RangeError("offset is not uint");if(t+e>r)throw new RangeError("Trying to access beyond buffer length")}function M(t,e,r,i,n,o){if(!h.isBuffer(t))throw new TypeError('"buffer" argument must be a Buffer instance');if(e>n||e<o)throw new RangeError('"value" argument is out of bounds');if(r+i>t.length)throw new RangeError("Index out of range")}function D(t,e,r,i,n,o){if(r+i>t.length)throw new RangeError("Index out of range");if(r<0)throw new RangeError("Index out of range")}function F(t,e,r,i,o){return e=+e,r>>>=0,o||D(t,e,r,4,34028234663852886e22,-34028234663852886e22),n.write(t,e,r,i,23,4),r+4}function N(t,e,r,i,o){return e=+e,r>>>=0,o||D(t,e,r,8,17976931348623157e292,-17976931348623157e292),n.write(t,e,r,i,52,8),r+8}h.prototype.slice=function(t,e){var r=this.length;t=~~t,e=void 0===e?r:~~e,t<0?(t+=r,t<0&&(t=0)):t>r&&(t=r),e<0?(e+=r,e<0&&(e=0)):e>r&&(e=r),e<t&&(e=t);var i=this.subarray(t,e);return Object.setPrototypeOf(i,h.prototype),i},h.prototype.readUintLE=h.prototype.readUIntLE=function(t,e,r){t>>>=0,e>>>=0,r||z(t,e,this.length);var i=this[t],n=1,o=0;while(++o<e&&(n*=256))i+=this[t+o]*n;return i},h.prototype.readUintBE=h.prototype.readUIntBE=function(t,e,r){t>>>=0,e>>>=0,r||z(t,e,this.length);var i=this[t+--e],n=1;while(e>0&&(n*=256))i+=this[t+--e]*n;return i},h.prototype.readUint8=h.prototype.readUInt8=function(t,e){return t>>>=0,e||z(t,1,this.length),this[t]},h.prototype.readUint16LE=h.prototype.readUInt16LE=function(t,e){return t>>>=0,e||z(t,2,this.length),this[t]|this[t+1]<<8},h.prototype.readUint16BE=h.prototype.readUInt16BE=function(t,e){return t>>>=0,e||z(t,2,this.length),this[t]<<8|this[t+1]},h.prototype.readUint32LE=h.prototype.readUInt32LE=function(t,e){return t>>>=0,e||z(t,4,this.length),(this[t]|this[t+1]<<8|this[t+2]<<16)+16777216*this[t+3]},h.prototype.readUint32BE=h.prototype.readUInt32BE=function(t,e){return t>>>=0,e||z(t,4,this.length),16777216*this[t]+(this[t+1]<<16|this[t+2]<<8|this[t+3])},h.prototype.readIntLE=function(t,e,r){t>>>=0,e>>>=0,r||z(t,e,this.length);var i=this[t],n=1,o=0;while(++o<e&&(n*=256))i+=this[t+o]*n;return n*=128,i>=n&&(i-=Math.pow(2,8*e)),i},h.prototype.readIntBE=function(t,e,r){t>>>=0,e>>>=0,r||z(t,e,this.length);var i=e,n=1,o=this[t+--i];while(i>0&&(n*=256))o+=this[t+--i]*n;return n*=128,o>=n&&(o-=Math.pow(2,8*e)),o},h.prototype.readInt8=function(t,e){return t>>>=0,e||z(t,1,this.length),128&this[t]?-1*(255-this[t]+1):this[t]},h.prototype.readInt16LE=function(t,e){t>>>=0,e||z(t,2,this.length);var r=this[t]|this[t+1]<<8;return 32768&r?4294901760|r:r},h.prototype.readInt16BE=function(t,e){t>>>=0,e||z(t,2,this.length);var r=this[t+1]|this[t]<<8;return 32768&r?4294901760|r:r},h.prototype.readInt32LE=function(t,e){return t>>>=0,e||z(t,4,this.length),this[t]|this[t+1]<<8|this[t+2]<<16|this[t+3]<<24},h.prototype.readInt32BE=function(t,e){return t>>>=0,e||z(t,4,this.length),this[t]<<24|this[t+1]<<16|this[t+2]<<8|this[t+3]},h.prototype.readFloatLE=function(t,e){return t>>>=0,e||z(t,4,this.length),n.read(this,t,!0,23,4)},h.prototype.readFloatBE=function(t,e){return t>>>=0,e||z(t,4,this.length),n.read(this,t,!1,23,4)},h.prototype.readDoubleLE=function(t,e){return t>>>=0,e||z(t,8,this.length),n.read(this,t,!0,52,8)},h.prototype.readDoubleBE=function(t,e){return t>>>=0,e||z(t,8,this.length),n.read(this,t,!1,52,8)},h.prototype.writeUintLE=h.prototype.writeUIntLE=function(t,e,r,i){if(t=+t,e>>>=0,r>>>=0,!i){var n=Math.pow(2,8*r)-1;M(this,t,e,r,n,0)}var o=1,s=0;this[e]=255&t;while(++s<r&&(o*=256))this[e+s]=t/o&255;return e+r},h.prototype.writeUintBE=h.prototype.writeUIntBE=function(t,e,r,i){if(t=+t,e>>>=0,r>>>=0,!i){var n=Math.pow(2,8*r)-1;M(this,t,e,r,n,0)}var o=r-1,s=1;this[e+o]=255&t;while(--o>=0&&(s*=256))this[e+o]=t/s&255;return e+r},h.prototype.writeUint8=h.prototype.writeUInt8=function(t,e,r){return t=+t,e>>>=0,r||M(this,t,e,1,255,0),this[e]=255&t,e+1},h.prototype.writeUint16LE=h.prototype.writeUInt16LE=function(t,e,r){return t=+t,e>>>=0,r||M(this,t,e,2,65535,0),this[e]=255&t,this[e+1]=t>>>8,e+2},h.prototype.writeUint16BE=h.prototype.writeUInt16BE=function(t,e,r){return t=+t,e>>>=0,r||M(this,t,e,2,65535,0),this[e]=t>>>8,this[e+1]=255&t,e+2},h.prototype.writeUint32LE=h.prototype.writeUInt32LE=function(t,e,r){return t=+t,e>>>=0,r||M(this,t,e,4,4294967295,0),this[e+3]=t>>>24,this[e+2]=t>>>16,this[e+1]=t>>>8,this[e]=255&t,e+4},h.prototype.writeUint32BE=h.prototype.writeUInt32BE=function(t,e,r){return t=+t,e>>>=0,r||M(this,t,e,4,4294967295,0),this[e]=t>>>24,this[e+1]=t>>>16,this[e+2]=t>>>8,this[e+3]=255&t,e+4},h.prototype.writeIntLE=function(t,e,r,i){if(t=+t,e>>>=0,!i){var n=Math.pow(2,8*r-1);M(this,t,e,r,n-1,-n)}var o=0,s=1,a=0;this[e]=255&t;while(++o<r&&(s*=256))t<0&&0===a&&0!==this[e+o-1]&&(a=1),this[e+o]=(t/s>>0)-a&255;return e+r},h.prototype.writeIntBE=function(t,e,r,i){if(t=+t,e>>>=0,!i){var n=Math.pow(2,8*r-1);M(this,t,e,r,n-1,-n)}var o=r-1,s=1,a=0;this[e+o]=255&t;while(--o>=0&&(s*=256))t<0&&0===a&&0!==this[e+o+1]&&(a=1),this[e+o]=(t/s>>0)-a&255;return e+r},h.prototype.writeInt8=function(t,e,r){return t=+t,e>>>=0,r||M(this,t,e,1,127,-128),t<0&&(t=255+t+1),this[e]=255&t,e+1},h.prototype.writeInt16LE=function(t,e,r){return t=+t,e>>>=0,r||M(this,t,e,2,32767,-32768),this[e]=255&t,this[e+1]=t>>>8,e+2},h.prototype.writeInt16BE=function(t,e,r){return t=+t,e>>>=0,r||M(this,t,e,2,32767,-32768),this[e]=t>>>8,this[e+1]=255&t,e+2},h.prototype.writeInt32LE=function(t,e,r){return t=+t,e>>>=0,r||M(this,t,e,4,2147483647,-2147483648),this[e]=255&t,this[e+1]=t>>>8,this[e+2]=t>>>16,this[e+3]=t>>>24,e+4},h.prototype.writeInt32BE=function(t,e,r){return t=+t,e>>>=0,r||M(this,t,e,4,2147483647,-2147483648),t<0&&(t=4294967295+t+1),this[e]=t>>>24,this[e+1]=t>>>16,this[e+2]=t>>>8,this[e+3]=255&t,e+4},h.prototype.writeFloatLE=function(t,e,r){return F(this,t,e,!0,r)},h.prototype.writeFloatBE=function(t,e,r){return F(this,t,e,!1,r)},h.prototype.writeDoubleLE=function(t,e,r){return N(this,t,e,!0,r)},h.prototype.writeDoubleBE=function(t,e,r){return N(this,t,e,!1,r)},h.prototype.copy=function(t,e,r,i){if(!h.isBuffer(t))throw new TypeError("argument should be a Buffer");if(r||(r=0),i||0===i||(i=this.length),e>=t.length&&(e=t.length),e||(e=0),i>0&&i<r&&(i=r),i===r)return 0;if(0===t.length||0===this.length)return 0;if(e<0)throw new RangeError("targetStart out of bounds");if(r<0||r>=this.length)throw new RangeError("Index out of range");if(i<0)throw new RangeError("sourceEnd out of bounds");i>this.length&&(i=this.length),t.length-e<i-r&&(i=t.length-e+r);var n=i-r;return this===t&&"function"===typeof Uint8Array.prototype.copyWithin?this.copyWithin(e,r,i):Uint8Array.prototype.set.call(t,this.subarray(r,i),e),n},h.prototype.fill=function(t,e,r,i){if("string"===typeof t){if("string"===typeof e?(i=e,e=0,r=this.length):"string"===typeof r&&(i=r,r=this.length),void 0!==i&&"string"!==typeof i)throw new TypeError("encoding must be a string");if("string"===typeof i&&!h.isEncoding(i))throw new TypeError("Unknown encoding: "+i);if(1===t.length){var n=t.charCodeAt(0);("utf8"===i&&n<128||"latin1"===i)&&(t=n)}}else"number"===typeof t?t&=255:"boolean"===typeof t&&(t=Number(t));if(e<0||this.length<e||this.length<r)throw new RangeError("Out of range index");if(r<=e)return this;var o;if(e>>>=0,r=void 0===r?this.length:r>>>0,t||(t=0),"number"===typeof t)for(o=e;o<r;++o)this[o]=t;else{var s=h.isBuffer(t)?t:h.from(t,i),a=s.length;if(0===a)throw new TypeError('The value "'+t+'" is invalid for argument "value"');for(o=0;o<r-e;++o)this[o+e]=s[o%a]}return this};var Z=/[^+/0-9A-Za-z-_]/g;function W(t){if(t=t.split("=")[0],t=t.trim().replace(Z,""),t.length<2)return"";while(t.length%4!==0)t+="=";return t}function q(t,e){var r;e=e||1/0;for(var i=t.length,n=null,o=[],s=0;s<i;++s){if(r=t.charCodeAt(s),r>55295&&r<57344){if(!n){if(r>56319){(e-=3)>-1&&o.push(239,191,189);continue}if(s+1===i){(e-=3)>-1&&o.push(239,191,189);continue}n=r;continue}if(r<56320){(e-=3)>-1&&o.push(239,191,189),n=r;continue}r=65536+(n-55296<<10|r-56320)}else n&&(e-=3)>-1&&o.push(239,191,189);if(n=null,r<128){if((e-=1)<0)break;o.push(r)}else if(r<2048){if((e-=2)<0)break;o.push(r>>6|192,63&r|128)}else if(r<65536){if((e-=3)<0)break;o.push(r>>12|224,r>>6&63|128,63&r|128)}else{if(!(r<1114112))throw new Error("Invalid code point");if((e-=4)<0)break;o.push(r>>18|240,r>>12&63|128,r>>6&63|128,63&r|128)}}return o}function Y(t){for(var e=[],r=0;r<t.length;++r)e.push(255&t.charCodeAt(r));return e}function K(t,e){for(var r,i,n,o=[],s=0;s<t.length;++s){if((e-=2)<0)break;r=t.charCodeAt(s),i=r>>8,n=r%256,o.push(n),o.push(i)}return o}function G(t){return i.toByteArray(W(t))}function H(t,e,r,i){for(var n=0;n<i;++n){if(n+r>=e.length||n>=t.length)break;e[n+r]=t[n]}return n}function X(t,e){return t instanceof e||null!=t&&null!=t.constructor&&null!=t.constructor.name&&t.constructor.name===e.name}function J(t){return t!==t}var Q=function(){for(var t="0123456789abcdef",e=new Array(256),r=0;r<16;++r)for(var i=16*r,n=0;n<16;++n)e[i+n]=t[r]+t[n];return e}()},80645:function(t,e){
/*! ieee754. BSD-3-Clause License. Feross Aboukhadijeh <https://feross.org/opensource> */
e.read=function(t,e,r,i,n){var o,s,a=8*n-i-1,u=(1<<a)-1,h=u>>1,l=-7,f=r?n-1:0,p=r?-1:1,c=t[e+f];for(f+=p,o=c&(1<<-l)-1,c>>=-l,l+=a;l>0;o=256*o+t[e+f],f+=p,l-=8);for(s=o&(1<<-l)-1,o>>=-l,l+=i;l>0;s=256*s+t[e+f],f+=p,l-=8);if(0===o)o=1-h;else{if(o===u)return s?NaN:1/0*(c?-1:1);s+=Math.pow(2,i),o-=h}return(c?-1:1)*s*Math.pow(2,o-i)},e.write=function(t,e,r,i,n,o){var s,a,u,h=8*o-n-1,l=(1<<h)-1,f=l>>1,p=23===n?Math.pow(2,-24)-Math.pow(2,-77):0,c=i?0:o-1,y=i?1:-1,d=e<0||0===e&&1/e<0?1:0;for(e=Math.abs(e),isNaN(e)||e===1/0?(a=isNaN(e)?1:0,s=l):(s=Math.floor(Math.log(e)/Math.LN2),e*(u=Math.pow(2,-s))<1&&(s--,u*=2),e+=s+f>=1?p/u:p*Math.pow(2,1-f),e*u>=2&&(s++,u/=2),s+f>=l?(a=0,s=l):s+f>=1?(a=(e*u-1)*Math.pow(2,n),s+=f):(a=e*Math.pow(2,f-1)*Math.pow(2,n),s=0));n>=8;t[r+c]=255&a,c+=y,a/=256,n-=8);for(s=s<<n|a,h+=n;h>0;t[r+c]=255&s,c+=y,s/=256,h-=8);t[r+c-y]|=128*d}},27781:function(t,e,r){"use strict";r.d(e,{Z:function(){return h}});r(26699);var i=r(55978),n=i.Z,o=r(95424),s=r(4589),a=r(71824),u=r(76290),h=n.extend({name:"v-file-input",model:{prop:"value",event:"change"},props:{chips:Boolean,clearable:{type:Boolean,default:!0},counterSizeString:{type:String,default:"$vuetify.fileInput.counterSize"},counterString:{type:String,default:"$vuetify.fileInput.counter"},hideInput:Boolean,multiple:Boolean,placeholder:String,prependIcon:{type:String,default:"$file"},readonly:{type:Boolean,default:!1},showSize:{type:[Boolean,Number],default:!1,validator:t=>"boolean"===typeof t||[1e3,1024].includes(t)},smallChips:Boolean,truncateLength:{type:[Number,String],default:22},type:{type:String,default:"file"},value:{default:void 0,validator:t=>(0,s.TI)(t).every((t=>null!=t&&"object"===typeof t))}},computed:{classes(){return{...n.options.computed.classes.call(this),"v-file-input":!0}},computedCounterValue(){const t=this.multiple&&this.lazyValue?this.lazyValue.length:this.lazyValue instanceof File?1:0;if(!this.showSize)return this.$vuetify.lang.t(this.counterString,t);const e=this.internalArrayValue.reduce(((t,{size:e=0})=>t+e),0);return this.$vuetify.lang.t(this.counterSizeString,t,(0,s.XE)(e,1024===this.base))},internalArrayValue(){return(0,s.TI)(this.internalValue)},internalValue:{get(){return this.lazyValue},set(t){this.lazyValue=t,this.$emit("change",this.lazyValue)}},isDirty(){return this.internalArrayValue.length>0},isLabelActive(){return this.isDirty},text(){return this.isDirty||!this.persistentPlaceholder&&!this.isFocused&&this.hasLabel?this.internalArrayValue.map((t=>{const{name:e="",size:r=0}=t,i=this.truncateText(e);return this.showSize?`${i} (${(0,s.XE)(r,1024===this.base)})`:i})):[this.placeholder]},base(){return"boolean"!==typeof this.showSize?this.showSize:void 0},hasChips(){return this.chips||this.smallChips}},watch:{readonly:{handler(t){!0===t&&(0,a.N6)("readonly is not supported on <v-file-input>",this)},immediate:!0},value(t){const e=this.multiple?t:t?[t]:[];(0,s.vZ)(e,this.$refs.input.files)||(this.$refs.input.value="")}},methods:{clearableCallback(){this.internalValue=this.multiple?[]:null,this.$refs.input.value=""},genChips(){return this.isDirty?this.text.map(((t,e)=>this.$createElement(o.Z,{props:{small:this.smallChips},on:{"click:close":()=>{const t=this.internalValue;t.splice(e,1),this.internalValue=t}}},[t]))):[]},genControl(){const t=n.options.methods.genControl.call(this);return this.hideInput&&(t.data.style=(0,u.y0)(t.data.style,{display:"none"})),t},genInput(){const t=n.options.methods.genInput.call(this);return t.data.attrs.multiple=this.multiple,delete t.data.domProps.value,delete t.data.on.input,t.data.on.change=this.onInput,[this.genSelections(),t]},genPrependSlot(){if(!this.prependIcon)return null;const t=this.genIcon("prepend",(()=>{this.$refs.input.click()}));return this.genSlot("prepend","outer",[t])},genSelectionText(){const t=this.text.length;return t<2?this.text:this.showSize&&!this.counter?[this.computedCounterValue]:[this.$vuetify.lang.t(this.counterString,t)]},genSelections(){const t=[];return this.isDirty&&this.$scopedSlots.selection?this.internalArrayValue.forEach(((e,r)=>{this.$scopedSlots.selection&&t.push(this.$scopedSlots.selection({text:this.text[r],file:e,index:r}))})):t.push(this.hasChips&&this.isDirty?this.genChips():this.genSelectionText()),this.$createElement("div",{staticClass:"v-file-input__text",class:{"v-file-input__text--placeholder":this.placeholder&&!this.isDirty,"v-file-input__text--chips":this.hasChips&&!this.$scopedSlots.selection}},t)},genTextFieldSlot(){const t=n.options.methods.genTextFieldSlot.call(this);return t.data.on={...t.data.on||{},click:()=>this.$refs.input.click()},t},onInput(t){const e=[...t.target.files||[]];this.internalValue=this.multiple?e:e[0],this.initialValue=this.internalValue},onKeyDown(t){this.$emit("keydown",t)},truncateText(t){if(t.length<Number(this.truncateLength))return t;const e=Math.floor((Number(this.truncateLength)-1)/2);return`${t.slice(0,e)}…${t.slice(t.length-e)}`}}})},46049:function(t,e,r){"use strict";r.r(e),r.d(e,{default:function(){return B}});var i=function(){var t=this,e=t.$createElement,r=t._self._c||e;return t.hide?t._e():r("ihris-element",{attrs:{edit:t.edit,loading:!1},scopedSlots:t._u([{key:"form",fn:function(){return[r("v-file-input",{attrs:{disabled:t.disabled,label:t.display,loading:t.loading,outlined:"","hide-details":"auto",rules:t.rules,dense:"",accept:t.attachmentTypes,"error-messages":t.errors},on:{change:t.doUpload},scopedSlots:t._u([{key:"label",fn:function(){return[t._v(t._s(t.$t("App.fhir-resources-texts."+t.display))+" "),t.required?r("span",{staticClass:"red--text font-weight-bold"},[t._v("*")]):t._e()]},proxy:!0},{key:"append-outer",fn:function(){return[t.objURL?r("v-menu",{attrs:{"offset-y":"",left:"",eager:""},scopedSlots:t._u([{key:"activator",fn:function(e){var i=e.on,n=e.attrs;return[r("v-btn",t._g(t._b({attrs:{color:"accent",dark:"",fab:"","x-small":""}},"v-btn",n,!1),i),[r("v-icon",[t._v("mdi-file-eye")])],1)]}}],null,!1,3582535098)},[r("v-list",[r("v-list-item",[t.isImage?r("v-img",{attrs:{src:t.objURL}}):r("a",{attrs:{download:t.value.title,href:t.objURL}},[t._v(t._s(t.value.title))])],1)],1)],1):t._e()]},proxy:!0}],null,!1,1760073392),model:{value:t.upload,callback:function(e){t.upload=e},expression:"upload"}})]},proxy:!0},{key:"header",fn:function(){return[t._v(" "+t._s(t.$t("App.fhir-resources-texts."+t.display))+" ")]},proxy:!0},{key:"value",fn:function(){return[t.isImage?r("v-menu",{attrs:{absolute:"",eager:""},scopedSlots:t._u([{key:"activator",fn:function(e){var i=e.on,n=e.attrs;return[r("v-img",t._g(t._b({attrs:{src:t.objURL,contain:"","max-height":150,position:"left"}},"v-img",n,!1),i))]}}],null,!1,3173132963)},[r("v-list",{attrs:{"min-width":"0"}},[r("v-list-item",[r("v-img",{attrs:{src:t.objURL}})],1)],1)],1):r("a",{attrs:{href:t.objURL}},[t._v(t._s(t.value.title))])]},proxy:!0}],null,!1,2935000010)})},n=[],o=r(48764),s=r(22130),a=r(84794),u=r(31997),h={name:"fhir-attachment",props:["field","label","min","max","id","path","slotProps","sliceName","base-min","base-max","edit","readOnlyIfSet","constraints","displayCondition","enableBehavior","initial","maxValueAttachment","attachment-types"],components:{IhrisElement:s.Z},mixins:[u.x],data:function(){return{source:{path:"",data:{}},loading:!1,upload:void 0,value:{contentType:"",data:"",title:""},origValue:{contentType:"",data:"",title:""},qField:"valueAttachment",disabled:!1,objURL:"",errors:[],lockWatch:!1}},created:function(){this.initial&&!this.$route.params.id&&(this.value=this.initial),this.maxUpload=this.humanReadableToBytes(this.maxValueAttachment),this.hideShowField(this.displayCondition,this.enableBehavior),this.setupData()},watch:{hide(t){t&&(this.value={contentType:"",data:"",title:""})},slotProps:{handler(){this.lockWatch||this.setupData()},deep:!0},value(t){a.Y.$emit(this.path,t)}},methods:{setupData(){if(this.slotProps&&this.slotProps.source)if(this.source={path:this.slotProps.source.path+"."+this.field,data:{}},this.slotProps.source.fromArray)this.source.data=this.slotProps.source.data,this.value=this.source.data,this.origValue=this.value,this.lockWatch=!0;else{let t=this.$fhirutils.pathFieldExpression(this.field);this.source.data=this.$fhirpath.evaluate(this.slotProps.source.data,t);let e=null;if(1==this.source.data.length)e=this.source.data[0];else{let t,r=this.path.split("[");for(let e of r){let r=e.split("]");Number.isInteger(parseInt(r[0]))&&(t=r[0])}(t||0==t)&&(e=this.source.data[t])}null!=e&&(this.value=e,this.origValue=this.value,this.lockWatch=!0)}this.setObjectURL(),this.disabled=this.readOnlyIfSet&&!!this.value},setObjectURL(){if(this.objURL&&URL.revokeObjectURL(this.objURL),this.value.data&&this.value.contentType){let t="data:"+this.value.contentType+";base64,"+this.value.data;fetch(t).then((t=>t.blob())).then((t=>{this.upload=new File([t],this.value.title,{type:this.value.contentType,lastModified:(new Date).getTime()}),this.objURL=URL.createObjectURL(t),this.doUpload()})).catch((t=>{console.log("Failed to get data from base64.",t)}))}},doUpload(){if(this.errors=[],this.upload){if(this.loading=!0,this.upload.size>this.maxUpload)return this.errors.push(this.display+" is more than "+this.maxValueAttachment),void(this.loading=!1);this.value.contentType=this.upload.type,this.value.title=this.upload.name;let t=new FileReader;t.readAsArrayBuffer(this.upload),t.onload=()=>{let e=o.lW.from(t.result);this.value.data=e.toString("base64"),this.loading=!1,this.objURL=URL.createObjectURL(this.upload)}}else this.upload=void 0,this.value=this.origValue,this.objURL=""},humanReadableToBytes(t){let e={B:1,KB:1024,MB:1048576,GB:1024**3},r=/(\d+(?:\.\d+)?)\s*(B|KB|MB|GB)/i,i=r.exec(t);if(!i)return this.display+" Invalid default size format";let n=parseFloat(i[1]),o=i[2].toUpperCase();return e[o]?n*e[o]:this.display+" Invalid default size Unit "+o}},computed:{isImage:function(){return this.value.contentType&&this.value.contentType.startsWith("image/")},index:function(){return this.slotProps&&this.slotProps.input?this.slotProps.input.index:void 0},display:function(){return this.slotProps&&this.slotProps.input?this.slotProps.input.label:this.label},required:function(){return(this.index||0)<this.min},rules:function(){return this.required?[t=>!!t||this.$t(`App.fhir-resources-texts.${this.display}`)+" "+this.$t("App.hardcoded-texts.is required")]:[t=>!t||!t.length||t[0].size<this.maxUpload||this.$t(`App.fhir-resources-texts.${this.display}`)+" "+this.$t("App.hardcoded-texts.is more than")+" "+this.maxValueAttachment]}}},l=h,f=r(43736),p=r(43453),c=r.n(p),y=r(63150),d=r(27781),g=r(96428),v=r(97047),m=r(16816),w=r(97620),b=r(41152),E=(0,f.Z)(l,i,n,!1,null,null,null),B=E.exports;c()(E,{VBtn:y.Z,VFileInput:d.Z,VIcon:g.Z,VImg:v.Z,VList:m.Z,VListItem:w.Z,VMenu:b.Z})}}]);
//# sourceMappingURL=6049.0d39174a.js.map