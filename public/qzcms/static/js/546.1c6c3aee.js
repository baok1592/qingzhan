"use strict";(self["webpackChunkqz_cms"]=self["webpackChunkqz_cms"]||[]).push([[546],{405:function(e,t,l){l.d(t,{E6:function(){return n},IA:function(){return o},JW:function(){return d},Jf:function(){return c},NK:function(){return i},_z:function(){return u},am:function(){return r}});var a=l(1161);const n=()=>(0,a.Z)({url:"ad_seat"}),u=()=>(0,a.Z)({url:"ad_pc_all"}),i=()=>(0,a.Z)({url:"ad_mb_all"}),d=e=>(0,a.Z)({url:"ad_mb_sid?id="+e}),o=e=>(0,a.Z)({url:"ad_add",method:"POST",data:e}),r=e=>(0,a.Z)({url:"ad_del?id="+e,method:"DELETE"}),c=e=>(0,a.Z)({url:"ad_up",method:"POST",data:e})},4787:function(e,t,l){l.d(t,{Kn:function(){return r},M7:function(){return u},QJ:function(){return d},UI:function(){return o},hU:function(){return c},uV:function(){return n},xm:function(){return i}});var a=l(1161);const n=()=>(0,a.Z)({url:"article_all"}),u=e=>(0,a.Z)({url:"article_cid_ctx?cid="+e}),i=e=>(0,a.Z)({url:"article_del?id="+e,method:"DELETE"}),d=e=>(0,a.W)({url:"article_detail?id="+e}),o=e=>(0,a.Z)({url:"article_add",method:"POST",data:e}),r=e=>(0,a.Z)({url:"article_up",method:"POST",data:e}),c=(e,t)=>(0,a.Z)({url:"article_state?type="+e+"&id="+t,method:"PUT"})},7191:function(e,t,l){l.d(t,{$w:function(){return r},CI:function(){return n},FR:function(){return o},QA:function(){return s},U$:function(){return c},dK:function(){return u},gF:function(){return d},m:function(){return i}});var a=l(1161);const n=(e="")=>{let t="category_list";return""!==e&&(t="category_list?type="+e),(0,a.Z)({url:t})},u=e=>(0,a.Z)({url:"category_up_sort",method:"POST",data:e}),i=e=>(0,a.Z)({url:"category_add",method:"POST",data:e}),d=e=>(0,a.Z)({url:"category_update",method:"POST",data:e}),o=e=>(0,a.W)({url:"category_id?id="+e}),r=e=>(0,a.Z)({url:"category_del?id="+e,method:"DELETE"}),c=(e,t)=>(0,a.Z)({url:"category_state?type="+e+"&id="+t,method:"PUT"}),s=(e,t)=>(0,a.Z)({url:"up_home_tmp_ids?pid="+e+"&mid="+t,method:"PUT"})},2796:function(e,t,l){l.d(t,{e1:function(){return u},yv:function(){return n}});var a=l(1161);const n=e=>(0,a.Z)({url:"resource_dels",method:"POST",data:{type:"img",ids:e}}),u=()=>(0,a.Z)({url:"resource_type?type=img"})},4344:function(e,t,l){l.d(t,{$o:function(){return c},Mx:function(){return f},Ns:function(){return d},X5:function(){return s},_x:function(){return m},a9:function(){return r},qB:function(){return o}});var a=l(2262),n=l(6252),u=l(4787),i=l(7191);const d=[{name:"首页",en:"home"},{name:"列表",en:"lists"},{name:"图集",en:"cards"},{name:"产品",en:"pros"},{name:"封面",en:"cover"}],o=e=>{let t="--";return d.forEach((l=>{l.en==e&&(t=l.name)})),t},r=[{name:"封面",en:"cover"},{name:"文章列表",en:"lists"},{name:"图集列表",en:"cards"},{name:"产品列表",en:"pros"},{name:"首页",en:"home"}],c=e=>{const t={};return r.forEach((e=>{t[e.en]=e.name})),e in t?t[e]:"--"},s=[{name:"栏目",en:"category"},{name:"文章",en:"lists"}],m=(0,a.iH)(),f=(0,a.iH)();(0,n.YP)(f,(e=>{console.log("v:",e),"category"===e&&p(),"lists"===e&&_()}));const p=()=>{(0,i.CI)().then((e=>{m.value=e}))},_=()=>{(0,u.uV)().then((e=>{m.value=e}))}},5792:function(e,t,l){l.d(t,{E:function(){return u}});var a=l(2262),n=l(2796);function u(){const e=(0,a.iH)(),t=((0,a.iH)(),()=>{(0,n.e1)().then((t=>{e.value=t}))}),l=async e=>{const t=await(0,n.e1)().then((t=>{for(let l=0;l<t.length;l++){const a=t[l];if(a.id==e)return a.url}}));return t};return{imgAll:e,getImgAll:t,idGetImg:l}}},5874:function(e,t,l){l.d(t,{W:function(){return o}});var a=l(2262),n=(l(6699),l(4645)),u=l(7764),i=l(2796),d=l(961);function o(){const e=(0,a.iH)(),t=(0,a.iH)(100),l=(0,a.iH)(!1),o=(0,a.iH)([]);function r(e){const l=o.value.indexOf(e);if(l>-1)o.value.splice(l,1);else{if(o.value.length>=t.value)return void n.z8.error("超出限制数量："+t.value);o.value.push(e)}}function c(e){return o.value.includes(e)}const s=e=>{u.T.confirm("确定删除?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then((()=>{(0,i.yv)(o.value.toString()).then((t=>{n.z8.success("删除成功"),e()}))}))};function m(t){e.value=[d.v.BASE_URL+t],l.value=!0}function f(){l.value=!1}return{viewImg:e,isShowImage:l,delIds:o,setRadio:r,cmpRadio:c,del:s,setViewImg:m,closeImgViewer:f,limit:t}}},3424:function(e,t,l){l.d(t,{Z:function(){return H}});l(9921),l(5029),l(6844),l(4804),l(2521),l(4122),l(5301),l(6826);var a=l(2262),n=l(6252),u=l(3274),i=l(3276),d=l(7890),o=l(489),r=l(3236),c=l(6317),s=l(865),m=l(3577);const f=e=>{const t=document.body.scrollWidth,l=p(t);e(l),window.onresize=()=>{const t=document.body.scrollWidth,l=p(t);e(l)}},p=e=>{let t=0;return e<768&&(t=0),e<992&&e>=768&&(t=1),e<1200&&e>=992&&(t=2),e<1400&&e>=1200&&(t=3),e>=1400&&(t=4),t};var _=l(2553),v=l(961),w=l(5874),g=l(5792);const b={class:"cmp-pic-lib"},h={class:"pic-wrap"},y={class:"pic-tab"},W=["src","onClick"],U={class:"pic-btn"},S=(0,n.Uk)("关闭"),k=(0,n.Uk)("确定");var V=(0,n.aZ)({props:{modelValue:{type:Boolean,required:!0},fatherFun:{type:Function,required:!0},num:{type:Number,required:!0}},emits:["update:modelValue"],setup(e,{expose:t,emit:l}){const p=e,{getImgAll:V,imgAll:Z}=(0,g.E)(),{limit:j,delIds:H,setRadio:E,cmpRadio:x}=(0,w.W)(),z=(0,_.L)(),A=(0,a.iH)("first");let C=v.v.BASE_API+"/img_add?cid=1";const I={Authorization:"Bearer "+z.getToken};(0,n.YP)((()=>p.num),(e=>{console.log("num",e),j.value=e})),(0,n.bv)((()=>{D()}));const D=()=>{V()};function T(){l("update:modelValue",!1)}function P(){const e=Z.value,t=H.value;let l=[];e.forEach((e=>{t.indexOf(e.id)>=0&&l.push(e.url)})),p.fatherFun(t,l),H.value=[],T()}let $=(0,a.iH)();return f((e=>{$.value=e<3?"50%":700})),t({imgData:g.E}),(t,l)=>{const f=(0,n.up)("Plus"),p=s.gn,_=c.LW,w=r.Dv,g=o.dq,V=d.p8,j=d.Ub,H=i.mi,z=u.zd;return(0,n.wg)(),(0,n.iD)("div",b,[(0,n.Wm)(z,{"model-value":e.modelValue,title:"图库",direction:"rtl",size:(0,a.SU)($),onClose:T},{default:(0,n.w5)((()=>[(0,n._)("div",h,[(0,n.Wm)(j,{class:"demo-tabs",modelValue:A.value,"onUpdate:modelValue":l[0]||(l[0]=e=>A.value=e)},{default:(0,n.w5)((()=>[(0,n.Wm)(V,{label:"所有",name:"first"},{default:(0,n.w5)((()=>[(0,n._)("div",y,[(0,n.Wm)(g,null,{default:(0,n.w5)((()=>[(0,n.Wm)(w,{span:4},{default:(0,n.w5)((()=>[(0,n.Wm)(_,{class:"avatar-uploader",action:(0,a.SU)(C),"show-file-list":!1,headers:I,"on-success":D},{default:(0,n.w5)((()=>[(0,n.Wm)(p,{class:"avatar-uploader-icon"},{default:(0,n.w5)((()=>[(0,n.Wm)(f)])),_:1})])),_:1},8,["action"])])),_:1}),((0,n.wg)(!0),(0,n.iD)(n.HY,null,(0,n.Ko)((0,a.SU)(Z),(e=>((0,n.wg)(),(0,n.j4)(w,{key:e.id,span:4},{default:(0,n.w5)((()=>[(0,n._)("img",{src:(0,a.SU)(v.v).BASE_URL+e.url,class:(0,m.C_)(["el-image",(0,a.SU)(x)(e.id)?"radio":""]),onClick:t=>(0,a.SU)(E)(e.id)},null,10,W)])),_:2},1024)))),128))])),_:1})])])),_:1})])),_:1},8,["modelValue"]),(0,n._)("div",U,[(0,n.Wm)(H,{onClick:T},{default:(0,n.w5)((()=>[S])),_:1}),(0,n.Wm)(H,{type:"primary",onClick:P},{default:(0,n.w5)((()=>[k])),_:1})])])])),_:1},8,["model-value","size"])])}}}),Z=l(3744);const j=(0,Z.Z)(V,[["__scopeId","data-v-1e698ed2"]]);var H=j},3546:function(e,t,l){l.r(t),l.d(t,{default:function(){return Y}});l(6844),l(4804),l(2521),l(4122),l(5029),l(6826);var a=l(2262),n=l(6252),u=l(7890),i=l(489),d=l(3236),o=l(3276),r=l(865),c=l(3577),s=l(405),m=(l(2952),l(2919),l(8842),l(4429),l(5501)),f=l(6095),p=l(4209),_=l(4645),v=l(961);const w={class:"pc-ad-list"};var g=(0,n.aZ)({props:{adseat:{type:Object,required:!0},data:{type:Array,required:!0}},emits:["del","edit"],setup(e,{emit:t}){const l=e,u=e=>{const t=l.adseat;return e in t?l.adseat[e]:""},i=e=>{(0,s.am)(e).then((e=>{_.z8.success("操作成功"),t("del")}))},d=e=>{t("edit",e)};return(t,l)=>{const r=m.$Y,s=p.F8,_=o.mi,g=f.i1,b=m.eI,h=(0,n.Q2)("auth");return(0,n.wg)(),(0,n.iD)("div",w,[(0,n.Wm)(b,{data:e.data,style:{width:"100%"},class:"table-list"},{default:(0,n.w5)((()=>[(0,n.Wm)(r,{align:"center",type:"index",label:t.$t("msg.table.ranking"),width:"100"},null,8,["label"]),(0,n.Wm)(r,{align:"center",prop:"title",l:"",label:"AD "+t.$t("msg.table.title"),width:"260"},null,8,["label"]),(0,n.Wm)(r,{align:"center",label:t.$t("msg.table.adsense"),width:"200"},{default:(0,n.w5)((e=>[(0,n.Uk)((0,c.zw)(u(e.row.banner_id)),1)])),_:1},8,["label"]),(0,n.Wm)(r,{align:"center",label:t.$t("msg.table.thumbnail"),width:"160"},{default:(0,n.w5)((e=>[(0,n.Wm)(s,{class:"list-box-pic",src:(0,a.SU)(v.v).BASE_URL+e.row.url,alt:e.$index,fit:"fill"},null,8,["src","alt"])])),_:1},8,["label"]),(0,n.Wm)(r,{align:"center",label:t.$t("msg.table.operation")},{default:(0,n.w5)((e=>[(0,n.Wm)(_,{size:"small",onClick:t=>d(e.$index)},{default:(0,n.w5)((()=>[(0,n.Uk)((0,c.zw)(t.$t("msg.table.edit")),1)])),_:2},1032,["onClick"]),(0,n.Wm)(g,{title:"是否删除",onConfirm:t=>i(e.row.id)},{reference:(0,n.w5)((()=>[(0,n.wy)(((0,n.wg)(),(0,n.j4)(_,{size:"small",type:"danger",plain:""},{default:(0,n.w5)((()=>[(0,n.Uk)((0,c.zw)(t.$t("msg.table.remove")),1)])),_:1})),[[h,["ArticleDel"]]])])),_:2},1032,["onConfirm"])])),_:1},8,["label"])])),_:1},8,["data"])])}}}),b=l(3744);const h=(0,b.Z)(g,[["__scopeId","data-v-65f965c3"]]);var y=h,W=(l(9086),l(126),l(2270),l(6309),l(6972),l(3504),l(8670)),U=l(5288),S=l(9546),k=l(2723),V=l(3967),Z=l(3424),j=l(4344);const H={class:""},E=["src"],x={class:"dialog-footer"},z=(0,n.Uk)("取消"),A=(0,n.Uk)("确定");var C=(0,n.aZ)({props:{isShow:{type:Boolean,required:!0},adseat:{type:Object,required:!0},data:{type:Object,required:!0}},emits:["update:isShow","sub"],setup(e,{emit:t}){const l=e,u=(0,a.iH)(!1),i=(0,a.iH)([]),d=(e,t)=>{i.value=t,h.img_id=e[0]},c=(0,a.iH)(!1),m=(0,a.iH)(),f=()=>{m.value=1,u.value=!0},p=(0,V.NCN)(l,"isShow",t);function w(){p.value=!1,h.title="",h.banner_id=0,h.jump_type="",h.jump_id=0,h.img_id=0,h.one="",h.two="",i.value=[],t("sub")}const g=(0,a.iH)(),b=()=>{if(c.value){let e={id:y.value,...h};(0,s.Jf)(e).then((e=>{_.z8.success("修改成功"),w()}))}else(0,s.IA)(h).then((e=>{_.z8.success("新增成功"),w()}))},h=(0,a.qj)({title:"",banner_id:0,jump_type:"",jump_id:0,img_id:0,one:"",two:""}),y=(0,a.iH)();return(0,n.YP)((()=>l.data),(e=>{console.log(e),i.value=[e.img_url],y.value=e.id,h.title=e.title,h.banner_id=e.banner_id,h.jump_type=e.jump_type,h.jump_id=e.jump_id,h.img_id=e.img_id,h.one=e.one,h.two=e.two,""===e.title?c.value=!1:c.value=!0})),(0,n.YP)((()=>h.jump_type),(e=>{j.Mx.value=e})),(t,l)=>{const s=k.EZ,_=U.nH,y=S.BT,V=S.km,C=(0,n.up)("plus"),I=r.gn,D=U.ly,T=o.mi,P=W.d0;return(0,n.wg)(),(0,n.iD)("div",H,[(0,n.Wm)(P,{"model-value":(0,a.SU)(p),title:(c.value?"修改":"添加")+"广告",width:"35%",draggable:"",onClose:w},{footer:(0,n.w5)((()=>[(0,n._)("span",x,[(0,n.Wm)(T,{onClick:w},{default:(0,n.w5)((()=>[z])),_:1}),(0,n.Wm)(T,{type:"primary",onClick:b},{default:(0,n.w5)((()=>[A])),_:1})])])),default:(0,n.w5)((()=>[(0,n.Wm)(D,{model:(0,a.SU)(h),"label-width":"80px"},{default:(0,n.w5)((()=>[(0,n.Wm)(_,{label:"广告名"},{default:(0,n.w5)((()=>[(0,n.Wm)(s,{style:{width:"260px"},modelValue:(0,a.SU)(h).title,"onUpdate:modelValue":l[0]||(l[0]=e=>(0,a.SU)(h).title=e)},null,8,["modelValue"])])),_:1}),(0,n.Wm)(_,{label:"广告位"},{default:(0,n.w5)((()=>[(0,n.Wm)(V,{modelValue:(0,a.SU)(h).banner_id,"onUpdate:modelValue":l[1]||(l[1]=e=>(0,a.SU)(h).banner_id=e),placeholder:"请选择"},{default:(0,n.w5)((()=>[((0,n.wg)(!0),(0,n.iD)(n.HY,null,(0,n.Ko)(e.adseat,((e,t)=>((0,n.wg)(),(0,n.j4)(y,{key:t,label:e,value:t},null,8,["label","value"])))),128))])),_:1},8,["modelValue"])])),_:1}),(0,n.Wm)(_,{label:"跳转类型"},{default:(0,n.w5)((()=>[(0,n.Wm)(V,{modelValue:(0,a.SU)(h).jump_type,"onUpdate:modelValue":l[2]||(l[2]=e=>(0,a.SU)(h).jump_type=e),placeholder:"请选择"},{default:(0,n.w5)((()=>[(0,n.Wm)(y,{label:"无",value:""}),((0,n.wg)(!0),(0,n.iD)(n.HY,null,(0,n.Ko)((0,a.SU)(j.X5),(e=>((0,n.wg)(),(0,n.j4)(y,{key:e.en,label:e.name,value:e.en},null,8,["label","value"])))),128))])),_:1},8,["modelValue"])])),_:1}),""!=(0,a.SU)(h).jump_type?((0,n.wg)(),(0,n.j4)(_,{key:0,label:"跳转到"},{default:(0,n.w5)((()=>[(0,n.Wm)(V,{modelValue:(0,a.SU)(h).jump_id,"onUpdate:modelValue":l[3]||(l[3]=e=>(0,a.SU)(h).jump_id=e),placeholder:"请选择"},{default:(0,n.w5)((()=>[((0,n.wg)(!0),(0,n.iD)(n.HY,null,(0,n.Ko)((0,a.SU)(j._x),(e=>((0,n.wg)(),(0,n.j4)(y,{key:e.id,label:e.title??e.name,value:e.id},null,8,["label","value"])))),128))])),_:1},8,["modelValue"])])),_:1})):(0,n.kq)("",!0),(0,n.Wm)(_,{label:"文字一"},{default:(0,n.w5)((()=>[(0,n.Wm)(s,{placeholder:"非必填",style:{width:"260px"},modelValue:(0,a.SU)(h).one,"onUpdate:modelValue":l[4]||(l[4]=e=>(0,a.SU)(h).one=e)},null,8,["modelValue"])])),_:1}),(0,n.Wm)(_,{label:"文字二"},{default:(0,n.w5)((()=>[(0,n.Wm)(s,{placeholder:"非必填",style:{width:"260px"},modelValue:(0,a.SU)(h).two,"onUpdate:modelValue":l[5]||(l[5]=e=>(0,a.SU)(h).two=e)},null,8,["modelValue"])])),_:1}),(0,n.Wm)(_,{label:"选图片"},{default:(0,n.w5)((()=>[(0,n._)("div",{class:"select-img",onClick:f},[""===i.value.toString()?((0,n.wg)(),(0,n.j4)(I,{key:0,size:30},{default:(0,n.w5)((()=>[(0,n.Wm)(C)])),_:1})):((0,n.wg)(!0),(0,n.iD)(n.HY,{key:1},(0,n.Ko)(i.value,(e=>((0,n.wg)(),(0,n.iD)("img",{key:e,class:"w-full h-full",src:(0,a.SU)(v.v).BASE_URL+e},null,8,E)))),128))])])),_:1})])),_:1},8,["model"])])),_:1},8,["model-value","title"]),(0,n.Wm)(Z.Z,{ref_key:"lib",ref:g,modelValue:u.value,"onUpdate:modelValue":l[6]||(l[6]=e=>u.value=e),num:m.value,fatherFun:d},null,8,["modelValue","num"])])}}});const I=(0,b.Z)(C,[["__scopeId","data-v-a51cb9d8"]]);var D=I,T=l(5792);const P={class:"page-ad right-main"},$={class:"flex"},q={class:"flex"};var O=(0,n.aZ)({setup(e){const{idGetImg:t}=(0,T.E)(),l=(0,a.iH)("first"),m=(0,a.iH)(!1);function f(){(0,s._z)().then((e=>{w.value=e})),(0,s.NK)().then((e=>{g.value=e}))}(0,n.bv)((()=>{f()}));const p=(0,a.iH)(),_=(0,a.iH)(),v=(0,a.iH)(),w=(0,a.iH)(),g=(0,a.iH)(),b=(0,a.iH)();function h(){m.value=!0,v.value="pc",k()}function W(){m.value=!0,v.value="mb",k()}function U(e){m.value=!0,v.value="mb";const t=g.value[e];V(t)}function S(e){m.value=!0,v.value="pc";const t=w.value[e];V(t)}function k(){b.value={title:"",banner_id:0,jump_type:"",jump_id:0,img_id:0}}function V(e){const l=t(e.img_id);l.then((t=>{b.value={id:e.id,title:e.title,banner_id:e.banner_id,jump_type:e.jump_type,jump_id:e.jump_id,img_id:e.img_id,img_url:t,one:e.one,two:e.two}}))}return(0,s.E6)().then((e=>{let t={},l={};e.forEach((e=>{e.type?l[e.id]=e.name:t[e.id]=e.name})),p.value=t,_.value=l})),(e,t)=>{const a=(0,n.up)("plus"),s=r.gn,k=o.mi,V=d.Dv,Z=i.dq,j=u.p8,H=u.Ub;return(0,n.wg)(),(0,n.iD)("div",P,[(0,n.Wm)(H,{modelValue:l.value,"onUpdate:modelValue":t[0]||(t[0]=e=>l.value=e),class:"demo-tabs"},{default:(0,n.w5)((()=>[(0,n.Wm)(j,{label:e.$t("msg.profile.pcAdvert"),name:"first"},{default:(0,n.w5)((()=>[(0,n.Wm)(Z,{class:"top-search-box mb-3"},{default:(0,n.w5)((()=>[(0,n.Wm)(V,{span:14},{default:(0,n.w5)((()=>[(0,n._)("div",$,[(0,n.Wm)(k,{type:"primary",onClick:h},{default:(0,n.w5)((()=>[(0,n.Wm)(s,{class:"add-btn",color:"#fff"},{default:(0,n.w5)((()=>[(0,n.Wm)(a)])),_:1}),(0,n.Uk)(" "+(0,c.zw)(e.$t("msg.profile.addAdvert")),1)])),_:1})])])),_:1})])),_:1}),(0,n.Wm)(y,{adseat:p.value,data:w.value,onEdit:S,onDel:f},null,8,["adseat","data"])])),_:1},8,["label"]),(0,n.Wm)(j,{label:e.$t("msg.profile.mobileAdvert"),name:"second"},{default:(0,n.w5)((()=>[(0,n.Wm)(Z,{class:"top-search-box mb-3"},{default:(0,n.w5)((()=>[(0,n.Wm)(V,{span:14},{default:(0,n.w5)((()=>[(0,n._)("div",q,[(0,n.Wm)(k,{type:"primary",onClick:W},{default:(0,n.w5)((()=>[(0,n.Wm)(s,{class:"add-btn",color:"#fff"},{default:(0,n.w5)((()=>[(0,n.Wm)(a)])),_:1}),(0,n.Uk)(" "+(0,c.zw)(e.$t("msg.profile.addAdvert")),1)])),_:1})])])),_:1})])),_:1}),(0,n.Wm)(y,{adseat:_.value,data:g.value,onEdit:U,onDel:f},null,8,["adseat","data"])])),_:1},8,["label"])])),_:1},8,["modelValue"]),(0,n.Wm)(D,{adseat:"pc"==v.value?p.value:_.value,isShow:m.value,"onUpdate:isShow":t[1]||(t[1]=e=>m.value=e),data:b.value,onSub:f},null,8,["adseat","isShow","data"])])}}});const B=(0,b.Z)(O,[["__scopeId","data-v-2ecf6225"]]);var Y=B}}]);