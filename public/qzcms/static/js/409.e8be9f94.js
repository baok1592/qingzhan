"use strict";(self["webpackChunkqz_cms"]=self["webpackChunkqz_cms"]||[]).push([[409],{6227:function(e,t,n){n(4991)},4108:function(e,t,n){n.d(t,{Q:function(){return o}});var a=n(6252),l=n(771),u=n(8034);function o(e,t){const n=(0,a.FN)(),o=(0,a.Fl)((()=>(0,l.jn)(n.props[t])?n.props[t]:n.props.teleported));return(0,u.A)({scope:e,from:t,replacement:"teleported",version:"2.1.0",ref:"https://element-plus.org/en-US/component/tooltip.html#attributes"},(0,a.Fl)((()=>(0,l.jn)(n.props[t])))),{compatTeleported:o}}},7585:function(e,t,n){n(4991)},2971:function(e,t,n){n(4991)},645:function(e,t,n){n.d(t,{Z:function(){return i}});var a=n(771),l=n(431);const u=new Map;let o;function r(e,t){let n=[];return Array.isArray(t.arg)?n=t.arg:(0,l.kK)(t.arg)&&n.push(t.arg),function(a,l){const u=t.instance.popperRef,o=a.target,r=null==l?void 0:l.target,i=!t||!t.instance,d=!o||!r,c=e.contains(o)||e.contains(r),s=e===o,f=n.length&&n.some((e=>null==e?void 0:e.contains(o)))||n.length&&n.includes(r),m=u&&(u.contains(o)||u.contains(r));i||d||c||s||f||m||t.value(a,l)}}a.C5&&(document.addEventListener("mousedown",(e=>o=e)),document.addEventListener("mouseup",(e=>{for(const t of u.values())for(const{documentHandler:n}of t)n(e,o)})));const i={beforeMount(e,t){u.has(e)||u.set(e,[]),u.get(e).push({documentHandler:r(e,t),bindingFn:t.value})},updated(e,t){u.has(e)||u.set(e,[]);const n=u.get(e),a=n.findIndex((e=>e.bindingFn===t.oldValue)),l={documentHandler:r(e,t),bindingFn:t.value};a>=0?n.splice(a,1,l):n.push(l)},unmounted(e){u.delete(e)}}},3476:function(e,t,n){n.d(t,{an:function(){return o},fO:function(){return u},kG:function(){return l},kk:function(){return i},r7:function(){return c},rd:function(){return r},uu:function(){return d}});var a=n(1161);const l=()=>(0,a.Z)({url:"pros_all"}),u=e=>(0,a.Z)({url:"pros_cid_ctx?cid="+e}),o=e=>(0,a.Z)({url:"pros_del?id="+e,method:"DELETE"}),r=e=>(0,a.W)({url:"pros_detail?id="+e}),i=e=>(0,a.Z)({url:"pros_add",method:"POST",data:e}),d=e=>(0,a.Z)({url:"pros_up",method:"POST",data:e}),c=(e,t)=>(0,a.Z)({url:"pros_state?type="+e+"&id="+t,method:"PUT"})},3127:function(e,t,n){n.d(t,{v:function(){return u},y:function(){return o}});var a=n(771),l=n(5793);const u=e=>{const t=(0,a.WJ)(1e3*e,"YYYY-MM-DD");return t.value},o=()=>{const e=l.t.get("Category"),t=[];return e.forEach((e=>{t.push({id:e.id,name:e.name,type:e.type}),e.children&&e.children.length>0&&e.children.forEach((e=>{t.push({id:e.id,name:e.name,type:e.type})}))})),t}},9293:function(e,t,n){n.r(t),n.d(t,{default:function(){return H}});var a=n(4645),l=(n(126),n(2270),n(6309),n(2521),n(4122),n(6972),n(3504),n(5029),n(6826),n(2262)),u=n(6252),o=(n(6227),n(5288)),r=n(9546),i=n(489),d=n(3236),c=n(2723),s=n(3276),f=n(865),m=n(3424),p=n(5088),v=n(961),g=n(3127),_=n(3476),h=n(8611);const w={class:"page-article-add right-main"},y={class:"top-back flex mb-4"},U=(0,u.Uk)(" 返 回"),W={class:"ctx_add py-2"},k={class:"imgs flex"},b=["src"],S={class:"editBox"},V=(0,u.Uk)(" 提交 "),Z=(0,u.Uk)(" 提交修改 ");var x=(0,u.aZ)({setup(e){const{Editor:t,Toolbar:n,editorRef:x,mode:C,toolbarConfig:T,editorConfig:H,handleCreated:E,getToolInfo:D}=(0,h.r)(),q=(0,l.iH)(!1),P=(0,l.iH)(6),F=(0,l.iH)([]),O=(0,l.iH)(),Y=(0,l.iH)(!1),j=(0,l.qj)({data:{title:"",desc:"",content:"",img_ids:[],price:0,before_price:0,category_id:0}});let z=0;(0,u.bv)((()=>{O.value=(0,g.y)(),p.ZP.currentRoute.value&&p.ZP.currentRoute.value.query.id&&(z=p.ZP.currentRoute.value.query.id,A(z))}));const A=async e=>{const t=await(0,_.rd)(e);j.data=t,Y.value=!0,F.value=t.urls,P.value=6-F.value.length},I=(e,t)=>{j.data.img_ids.length<1?(F.value=t,j.data.img_ids=e):(F.value.push(...t),j.data.img_ids.push(...e))},M=()=>{P.value=6-F.value.length,q.value=!0},R=e=>{j.data.img_ids.splice(e,1),F.value.splice(e,1)},L=((0,l.iH)(!1),()=>{const e=(0,l.IU)(j.data);(0,_.kk)(e).then((e=>{a.z8.success("创建成功"),p.ZP.push("/pro/list")}))}),B=()=>{let e=(0,l.IU)(j.data);e.id=z,(0,_.uu)(e).then((e=>{a.z8.success("修改成功"),p.ZP.push("/pro/list")}))};return(e,a)=>{const p=(0,u.up)("ArrowLeft"),g=f.gn,_=s.mi,h=(0,u.up)("router-link"),D=c.EZ,z=o.nH,A=d.Dv,K=i.dq,N=r.BT,$=r.km,G=(0,u.up)("circle-close"),J=(0,u.up)("plus"),Q=o.ly;return(0,u.wg)(),(0,u.iD)("div",w,[(0,u._)("div",y,[(0,u.Wm)(h,{to:"/pro/list"},{default:(0,u.w5)((()=>[(0,u.Wm)(_,{type:"primary"},{default:(0,u.w5)((()=>[(0,u.Wm)(g,null,{default:(0,u.w5)((()=>[(0,u.Wm)(p)])),_:1}),U])),_:1})])),_:1})]),(0,u._)("div",W,[(0,u.Wm)(Q,{model:(0,l.SU)(j),"label-width":"100px"},{default:(0,u.w5)((()=>[(0,u.Wm)(K,null,{default:(0,u.w5)((()=>[(0,u.Wm)(A,{span:16},{default:(0,u.w5)((()=>[(0,u.Wm)(z,{label:"产品名称"},{default:(0,u.w5)((()=>[(0,u.Wm)(D,{modelValue:(0,l.SU)(j).data.title,"onUpdate:modelValue":a[0]||(a[0]=e=>(0,l.SU)(j).data.title=e)},null,8,["modelValue"])])),_:1})])),_:1})])),_:1}),(0,u.Wm)(K,null,{default:(0,u.w5)((()=>[(0,u.Wm)(A,{span:8},{default:(0,u.w5)((()=>[(0,u.Wm)(z,{label:"栏目"},{default:(0,u.w5)((()=>[(0,u.Wm)($,{modelValue:(0,l.SU)(j).data.category_id,"onUpdate:modelValue":a[1]||(a[1]=e=>(0,l.SU)(j).data.category_id=e),placeholder:""},{default:(0,u.w5)((()=>[((0,u.wg)(!0),(0,u.iD)(u.HY,null,(0,u.Ko)(O.value,(e=>((0,u.wg)(),(0,u.iD)(u.HY,{key:e.id},["pros"==e.type?((0,u.wg)(),(0,u.j4)(N,{key:0,label:e.name,value:e.id},null,8,["label","value"])):(0,u.kq)("",!0)],64)))),128))])),_:1},8,["modelValue"])])),_:1})])),_:1}),(0,u.Wm)(A,{span:8},{default:(0,u.w5)((()=>[(0,u.Wm)(z,{label:"售价"},{default:(0,u.w5)((()=>[(0,u.Wm)(D,{modelValue:(0,l.SU)(j).data.price,"onUpdate:modelValue":a[2]||(a[2]=e=>(0,l.SU)(j).data.price=e),type:"text"},null,8,["modelValue"])])),_:1})])),_:1}),(0,u.Wm)(A,{span:8},{default:(0,u.w5)((()=>[(0,u.Wm)(z,{label:"原价"},{default:(0,u.w5)((()=>[(0,u.Wm)(D,{modelValue:(0,l.SU)(j).data.before_price,"onUpdate:modelValue":a[3]||(a[3]=e=>(0,l.SU)(j).data.before_price=e),type:"text"},null,8,["modelValue"])])),_:1})])),_:1})])),_:1}),(0,u.Wm)(z,{label:"产品摘要"},{default:(0,u.w5)((()=>[(0,u.Wm)(D,{modelValue:(0,l.SU)(j).data.desc,"onUpdate:modelValue":a[4]||(a[4]=e=>(0,l.SU)(j).data.desc=e),type:"text"},null,8,["modelValue"])])),_:1}),(0,u.Wm)(K,null,{default:(0,u.w5)((()=>[(0,u.Wm)(z,{label:"缩略图"},{default:(0,u.w5)((()=>[(0,u._)("div",k,[((0,u.wg)(!0),(0,u.iD)(u.HY,null,(0,u.Ko)(F.value,((e,t)=>((0,u.wg)(),(0,u.iD)("div",{class:"img mx-2",key:e},[(0,u._)("img",{class:"w-full h-full",src:(0,l.SU)(v.v).BASE_URL+e},null,8,b),(0,u.Wm)(g,{size:24,color:"#777",onClick:e=>R(t)},{default:(0,u.w5)((()=>[(0,u.Wm)(G)])),_:2},1032,["onClick"])])))),128)),P.value>0?((0,u.wg)(),(0,u.iD)("div",{key:0,class:"select-img mx-2",onClick:M},[(0,u.Wm)(g,{size:30},{default:(0,u.w5)((()=>[(0,u.Wm)(J)])),_:1})])):(0,u.kq)("",!0)])])),_:1})])),_:1}),(0,u.Wm)(z,null,{default:(0,u.w5)((()=>[(0,u._)("div",S,[(0,u.Wm)((0,l.SU)(n),{class:"editTool",editor:(0,l.SU)(x),defaultConfig:(0,l.SU)(T),mode:(0,l.SU)(C)},null,8,["editor","defaultConfig","mode"]),(0,u.Wm)((0,l.SU)(t),{class:"editCtx",style:{height:"400px"},modelValue:(0,l.SU)(j).data.content,"onUpdate:modelValue":a[5]||(a[5]=e=>(0,l.SU)(j).data.content=e),defaultConfig:(0,l.SU)(H),mode:(0,l.SU)(C),onOnCreated:(0,l.SU)(E)},null,8,["modelValue","defaultConfig","mode","onOnCreated"])])])),_:1}),(0,u.Wm)(z,null,{default:(0,u.w5)((()=>[Y.value?((0,u.wg)(),(0,u.j4)(_,{key:1,type:"primary",onClick:B},{default:(0,u.w5)((()=>[Z])),_:1})):((0,u.wg)(),(0,u.j4)(_,{key:0,type:"primary",onClick:L},{default:(0,u.w5)((()=>[V])),_:1}))])),_:1})])),_:1},8,["model"])]),(0,u.Wm)(m.Z,{ref:"lib",modelValue:q.value,"onUpdate:modelValue":a[6]||(a[6]=e=>q.value=e),num:P.value,fatherFun:I},null,8,["modelValue","num"])])}}}),C=n(3744);const T=(0,C.Z)(x,[["__scopeId","data-v-8a5a8948"]]);var H=T},8891:function(e,t,n){n.d(t,{Z:function(){return S}});var a=n(7226),l=n(6092),u=function(){return l.Z.Date.now()},o=u,r=/\s/;function i(e){var t=e.length;while(t--&&r.test(e.charAt(t)));return t}var d=i,c=/^\s+/;function s(e){return e?e.slice(0,d(e)+1).replace(c,""):e}var f=s,m=n(2714),p=NaN,v=/^[-+]0x[0-9a-f]+$/i,g=/^0b[01]+$/i,_=/^0o[0-7]+$/i,h=parseInt;function w(e){if("number"==typeof e)return e;if((0,m.Z)(e))return p;if((0,a.Z)(e)){var t="function"==typeof e.valueOf?e.valueOf():e;e=(0,a.Z)(t)?t+"":t}if("string"!=typeof e)return 0===e?e:+e;e=f(e);var n=g.test(e);return n||_.test(e)?h(e.slice(2),n?2:8):v.test(e)?p:+e}var y=w,U="Expected a function",W=Math.max,k=Math.min;function b(e,t,n){var l,u,r,i,d,c,s=0,f=!1,m=!1,p=!0;if("function"!=typeof e)throw new TypeError(U);function v(t){var n=l,a=u;return l=u=void 0,s=t,i=e.apply(a,n),i}function g(e){return s=e,d=setTimeout(w,t),f?v(e):i}function _(e){var n=e-c,a=e-s,l=t-n;return m?k(l,r-a):l}function h(e){var n=e-c,a=e-s;return void 0===c||n>=t||n<0||m&&a>=r}function w(){var e=o();if(h(e))return b(e);d=setTimeout(w,_(e))}function b(e){return d=void 0,p&&l?v(e):(l=u=void 0,i)}function S(){void 0!==d&&clearTimeout(d),s=0,l=c=u=d=void 0}function V(){return void 0===d?i:b(o())}function Z(){var e=o(),n=h(e);if(l=arguments,u=this,c=e,n){if(void 0===d)return g(c);if(m)return clearTimeout(d),d=setTimeout(w,t),v(c)}return void 0===d&&(d=setTimeout(w,t)),i}return t=y(t)||0,(0,a.Z)(n)&&(f=!!n.leading,m="maxWait"in n,r=m?W(y(n.maxWait)||0,t):r,p="trailing"in n?!!n.trailing:p),Z.cancel=S,Z.flush=V,Z}var S=b}}]);