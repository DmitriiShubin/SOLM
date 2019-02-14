LL = reshape(Rx_data,[64800*number_s,numpackets/3]);

%LL1 = zeros(size(LL,1),size(LL,2),'double');

%LL1(1:end-2,:) = LL(3:end,:);

%LL1(end-1:end,:) = LL(1:2,:);

Rx_data_LL = reshape(LL,[size(modulated_reshaped,1)*size(modulated_reshaped,2),1]);
%clear Rx_data

Rx_data_LL_I = real(Rx_data_LL);
Rx_data_LL_Q = imag(Rx_data_LL);

%LPF_LL = [2.04595046096463e-18 3.60844829373327e-05 5.11510461907471e-05 3.62625839997808e-05 -1.51177878218070e-18 -3.64751438197846e-05 -5.17524007203292e-05 -3.67225713022296e-05 9.70392931450681e-19 3.70052767594127e-05 5.25521580789748e-05 3.73236719423278e-05 -4.15487514089273e-19 -3.76781700735556e-05 -5.35549768369414e-05 -3.80691858817888e-05 -1.59443148248096e-19 3.84971356381057e-05 5.47655492676406e-05 3.89624371939248e-05 -2.39087321347316e-18 -3.94655100208264e-05 -5.61886029891343e-05 -4.00067752521675e-05 1.84259655241766e-18 4.05866557266451e-05 5.78289027662746e-05 4.12055760337879e-05 -1.26604265960095e-18 -4.18639625614806e-05 -5.96912524828578e-05 -4.25622435455570e-05 6.54159866332479e-19 4.33008491215340e-05 6.17804972937603e-05 4.40802113785144e-05 3.11529148050161e-22 -4.49007644154137e-05 -6.41015259676612e-05 -4.57629443994295e-05 -7.04841574466046e-19 4.66671896269937e-05 6.66592734316511e-05 4.76139405871178e-05 -2.39985779968016e-18 -4.86036400273381e-05 -6.94587235297677e-05 -4.96367330222330e-05 1.73805344211419e-18 5.07136670446644e-05 7.25049120083100e-05 5.18348920397812e-05 -1.01666229501961e-18 -5.30008605018807e-05 -7.58029297416484e-05 -5.42120275542178e-05 2.27637325097982e-19 5.54688510318743e-05 7.93579262131956e-05 5.67717915676878e-05 6.37289750232291e-19 -5.81213126815021e-05 -8.31751132672203e-05 -5.95178808726412e-05 3.25551952454108e-18 6.09619657158936e-05 8.72597691482908e-05 6.24540399609629e-05 -2.45298296368096e-18 -6.39945796356077e-05 -9.16172428463366e-05 -6.55840641525109e-05 1.56403883354697e-18 6.72229764200302e-05 9.62529587666131e-05 6.89118029569579e-05 -5.79808412737274e-19 -7.06510340113940e-05 -0.000101172421745268 -7.24411636838527e-05 -5.08823047296271e-19 7.42826900548401e-05 0.000106381222432737 7.61761153168522e-05 1.71121088771509e-18 -7.81219459111724e-05 -0.000111885043068878 -8.01206926694056e-05 3.48579155415210e-18 8.21728709600800e-05 0.000117689663675540 8.42790008403585e-05 -2.36546624966226e-18 -8.64396072131018e-05 -0.000123800968694269 -8.86552199894384e-05 1.11942615614646e-18 9.09263742570268e-05 0.000130224954098995 9.32536104541540e-05 2.62355845524968e-19 -9.56374745500350e-05 -0.000136967735015877 -9.80785182312347e-05 -1.79016953168676e-18 0.000100577299094765 0.000144035553885082 0.000103134380847764 -4.92082023020417e-18 -0.000105750333514253 -0.000151434789202038 -0.000108425733649016 3.49914424390913e-18 0.000111161164558983 0.000159171964878804 0.000113957216532322 -1.91831842581595e-18 -0.000116814487075506 -0.000167253760269516 -0.000119733581158677 1.67312407744467e-19 0.000122715111469625 0.000175687020907568 0.000125759698676517 1.76519741629733e-18 -0.000128867971700035 -0.000184478770006217 -0.000132040567994850 6.85321246682800e-18 0.000135278133841169 0.000193636220778703 0.000138581324646397 -5.05359494329820e-18 -0.000141950805257548 -0.000203166789638846 -0.000145387250284631 3.05806892254365e-18 0.000148891344435506 0.000213078110348440 0.000152463782862659 -8.54474895709097e-19 -0.000156105271522279 -0.000223378049183601 -0.000159816527546121 -1.56968241189864e-18 0.000163598279626824 0.000234074721198764 0.000167451268416827 -9.39098296189004e-18 -0.000171376246941885 -0.000245176507674119 -0.000175373981029320 7.12956399523918e-18 0.000179445249751935 0.000256692074840202 0.000183590845887986 -4.63171644465912e-18 -0.000187811576397955 -0.000268630393982072 -0.000192108262918824 1.88397670747928e-18 0.000196481742276485 0.000281000763035151 0.000200932867016998 1.12751393129750e-18 -0.000205462505957763 -0.000293812829795531 -0.000210071544758867 -4.41702787457067e-18 0.000214760886516132 0.000307076616879367 0.000219531452376130 -9.84280610065372e-18 -0.000224384182174613 -0.000320802548579222 -0.000229320035098969 6.74626456137664e-18 0.000234339990376011 0.000335001479779809 0.000239445047985927 -3.35339485558592e-18 -0.000244636229403866 -0.000349684727111959 -0.000249914578369939 -3.51293116007123e-19 0.000255281161689308 0.000364864102541764 0.000260737070063360 -6.20737623732981e-18 -0.000266283418953589 -0.000380551949612198 -0.000271921349479424 2.28377264371201e-18 0.000277652029351846 0.000396761182577171 0.000283476653844041 -9.52639993833684e-18 -0.000289396446801132 -0.000413505328693388 -0.000295412661690531 5.37630187027034e-18 0.000301526582695045 0.000430798573963826 0.000307739525850392 -8.60388226516153e-19 -0.000314052840229652 -0.000448655812658634 -0.000320467909176466 8.97200858817413e-18 0.000326986151589636 0.000467092700975128 0.000333609023261289 -4.20181475958779e-18 -0.000340338018271622 -0.000486125715239045 -0.000347174670442445 -9.73468850454505e-19 0.000354120554852957 0.000505772215094800 0.000361177289420426 -8.08717839966833e-18 -0.000368346536549280 -0.000526050512184024 -0.000375630004851802 2.62709771311371e-18 0.000383029450944419 0.000546979944869934 0.000390546681322970 3.28106378761159e-18 -0.000398183554321459 -0.000568580959631149 -0.000405941982158282 6.81531885819744e-18 0.000413823933074819 0.000590875199823595 0.000421831433570799 -5.88582200874458e-19 -0.000429966570742151 -0.000613885602594416 -0.000438231494726255 1.16488825754879e-17 0.000446628421260834 0.000637636504829058 0.000455159634362219 -5.09294479294644e-18 -0.000463827489130095 -0.000662153759123674 -0.000472634414685000 -1.98557623069042e-18 0.000481582917246626 0.000687464860902000 0.000490675583360360 -1.02950450544785e-17 -0.000499915083280697 -0.000713599087941410 -0.000509304174520250 2.84805777862297e-18 0.000518845705574256 0.000740587653740096 0.000528542619830215 -1.62641825365923e-17 -0.000538397959673987 -0.000768463876349845 -0.000548414870803578 8.43653681665974e-18 0.000558596606763295 0.000797263364521042 0.000568946533710985 2.01050144230555e-21 -0.000579468135433141 -0.000827024223263434 -0.000590165018622356 1.48566248308978e-17 0.000601040918433775 0.000857787281224063 0.000612099704337419 -5.99088141998022e-18 -0.000623345386285588 -0.000889596342629916 -0.000634782121214425 -3.55349870583547e-18 0.000646414219901794 0.000922498466946177 0.000658246154203898 -1.28868361614294e-17 -0.000670282564695535 -0.000956544279872118 -0.000682528268740281 2.86156662853525e-18 0.000694988269019534 0.000991788319848632 0.000707667762550496 7.92016054273189e-18 -0.000720572150226723 -0.00102828942489981 -0.000733707046916517 1.02592419252063e-17 0.000747078292157979 0.00106611116539495 0.000760691961491630 1.06620875970405e-18 -0.000774554378476300 -0.00110532232922019 -0.000788672127435996 1.87491371610795e-17 0.000803052066990796 0.00114599746691951 0.000817701344428070 -6.85944686806140e-18 -0.000832627410976404 -0.00118821750563799 -0.000847838038047993 -5.93146107391634e-18 0.000863341334522999 0.00123207044221982 0.000879145765154058 -1.59825969451614e-17 -0.000895260170176865 -0.00127765212763405 -0.000911693786219901 2.54785616155704e-18 0.000928456268615373 0.00132506715708933 0.000945557715221390 -2.64492071892457e-17 -0.000963008691876980 -0.00137442988284008 -0.000980820259621589 1.23451174240951e-17 0.000999004003823914 0.00142586556988711 0.00101757206537749 2.84948557440095e-18 -0.00103653717413731 -0.00147951171867044 -0.00105591268478657 2.36318426200138e-17 0.00107571261534299 0.00153551958361185 0.00109595168853359 -7.66364672628507e-18 -0.00111664537629129 -0.00159405592220969 -0.00113780994765054 1.35287710937962e-17 0.00115946252035021 0.00165530501659929 0.00118162111648179 -1.98376919236637e-17 -0.00120430472255897 -0.00171947101843372 -0.00122753335442305 1.71499835203174e-18 0.00125132812744554 0.00178678067908656 0.00127571133253871 -8.03134625800690e-18 -0.00130070651854314 -0.00185748654114980 -0.00132633858162508 1.48485905730337e-17 0.00135263386239003 0.00193187068481786 0.00137962025150033 5.79659437767441e-18 -0.00140732730467961 -0.00201024914509838 -0.00143578636809109 1.00218343584342e-18 0.00146503071519935 0.00209297714432985 0.00149509569636094 -8.37107986661822e-18 -0.00152601890254768 -0.00218045532117996 -0.00155784034478497 1.63599845960969e-17 0.00159060265109422 0.00227313718481918 0.00162435128296404 -2.50252491921206e-17 -0.00165913477364857 -0.00237153808498343 -0.00169500499090357 -2.99965909257646e-21 0.00173201742713645 0.00247624607024370 0.00177023152036555 -8.67941693367751e-18 -0.00180971100987539 -0.00258793511511096 -0.00185052433102349 1.81539615651620e-17 0.00189274505432210 0.00270738134170073 0.00193645237469718 1.08632596403001e-17 -0.00198173165774598 -0.00283548305798707 -0.00202867505089279 -1.42570271170719e-18 0.00207738216862139 0.00297328570309392 0.00212796086247478 -8.95324388195353e-18 -0.00218052808831486 -0.00312201316128858 -0.00223521088548280 2.03879090416363e-17 0.00229214748507615 0.00328310742604476 0.00235148856765217 -3.30132048071535e-17 -0.00241339869440428 -0.00345827933279633 -0.00247805794038234 -3.48412629973445e-18 0.00254566376383743 0.00364957413992824 0.00261643315250194 -9.18979561622246e-18 -0.00269060509588269 -0.00385945728813458 -0.00276844344284177 2.33552015092448e-17 0.00285024021638571 0.00409092797319490 0.00293631947334632 -9.29333142210861e-18 -0.00302704181639730 -0.00434767165752965 -0.00312280969076360 -6.59941044787291e-18 0.00322407362959014 0.00463426804000973 0.00333133965229571 -9.38668344510558e-18 -0.00344517807213160 -0.00495647952967674 -0.00356623403636814 2.76661210732886e-17 0.00369524021024212 0.00532165908732358 0.00383303213120202 -9.46961586990145e-18 -0.00398056691316377 -0.00573933932937454 -0.00413894618568482 -1.17084489438120e-17 0.00430944443058381 0.00622210440094521 0.00449354425813246 -9.54191920199364e-18 -0.00469298068992689 -0.00678691673844534 -0.00490979725051548 3.48234412694239e-17 0.00514641771249588 0.00745720198141200 0.00540573884016695 -9.60341079689024e-18 -0.00569125166967945 -0.00826625066984054 -0.00600720212327836 9.63005257323821e-18 0.00635880669127503 0.00926302113859140 0.00675254654381454 -9.65393532148580e-18 -0.00719657549234738 -0.0105225847261352 -0.00770129676273027 9.67504395677731e-18 0.00828019611191312 0.0121662127130687 0.00895107484061916 -9.69336514644627e-18 -0.00973792611697182 -0.0144033762828270 -0.0106738834850314 9.70888731843660e-18 0.0118060315892294 0.0176297464279999 0.0132036127042606 -9.72160066861177e-18 -0.0149727984888645 -0.0226931936934462 -0.0172850972046011 9.73149716694733e-18 0.0204367506278033 0.0317981872992302 0.0249873268440848 -9.73857056260281e-18 -0.0321359006905195 -0.0530277907491929 -0.0450000672589684 9.74281638786991e-18 0.0750110094125815 0.159129604724004 0.225049375499907 0.249969277385515 0.225049375499907 0.159129604724004 0.0750110094125815 9.74281638786991e-18 -0.0450000672589684 -0.0530277907491929 -0.0321359006905195 -9.73857056260281e-18 0.0249873268440848 0.0317981872992302 0.0204367506278033 9.73149716694733e-18 -0.0172850972046011 -0.0226931936934462 -0.0149727984888645 -9.72160066861177e-18 0.0132036127042606 0.0176297464279999 0.0118060315892294 9.70888731843660e-18 -0.0106738834850314 -0.0144033762828270 -0.00973792611697182 -9.69336514644627e-18 0.00895107484061916 0.0121662127130687 0.00828019611191312 9.67504395677731e-18 -0.00770129676273027 -0.0105225847261352 -0.00719657549234738 -9.65393532148580e-18 0.00675254654381454 0.00926302113859140 0.00635880669127503 9.63005257323821e-18 -0.00600720212327836 -0.00826625066984054 -0.00569125166967945 -9.60341079689024e-18 0.00540573884016695 0.00745720198141200 0.00514641771249588 3.48234412694239e-17 -0.00490979725051548 -0.00678691673844534 -0.00469298068992689 -9.54191920199364e-18 0.00449354425813246 0.00622210440094521 0.00430944443058381 -1.17084489438120e-17 -0.00413894618568482 -0.00573933932937454 -0.00398056691316377 -9.46961586990145e-18 0.00383303213120202 0.00532165908732358 0.00369524021024212 2.76661210732886e-17 -0.00356623403636814 -0.00495647952967674 -0.00344517807213160 -9.38668344510558e-18 0.00333133965229571 0.00463426804000973 0.00322407362959014 -6.59941044787291e-18 -0.00312280969076360 -0.00434767165752965 -0.00302704181639730 -9.29333142210861e-18 0.00293631947334632 0.00409092797319490 0.00285024021638571 2.33552015092448e-17 -0.00276844344284177 -0.00385945728813458 -0.00269060509588269 -9.18979561622246e-18 0.00261643315250194 0.00364957413992824 0.00254566376383743 -3.48412629973445e-18 -0.00247805794038234 -0.00345827933279633 -0.00241339869440428 -3.30132048071535e-17 0.00235148856765217 0.00328310742604476 0.00229214748507615 2.03879090416363e-17 -0.00223521088548280 -0.00312201316128858 -0.00218052808831486 -8.95324388195353e-18 0.00212796086247478 0.00297328570309392 0.00207738216862139 -1.42570271170719e-18 -0.00202867505089279 -0.00283548305798707 -0.00198173165774598 1.08632596403001e-17 0.00193645237469718 0.00270738134170073 0.00189274505432210 1.81539615651620e-17 -0.00185052433102349 -0.00258793511511096 -0.00180971100987539 -8.67941693367751e-18 0.00177023152036555 0.00247624607024370 0.00173201742713645 -2.99965909257646e-21 -0.00169500499090357 -0.00237153808498343 -0.00165913477364857 -2.50252491921206e-17 0.00162435128296404 0.00227313718481918 0.00159060265109422 1.63599845960969e-17 -0.00155784034478497 -0.00218045532117996 -0.00152601890254768 -8.37107986661822e-18 0.00149509569636094 0.00209297714432985 0.00146503071519935 1.00218343584342e-18 -0.00143578636809109 -0.00201024914509838 -0.00140732730467961 5.79659437767441e-18 0.00137962025150033 0.00193187068481786 0.00135263386239003 1.48485905730337e-17 -0.00132633858162508 -0.00185748654114980 -0.00130070651854314 -8.03134625800690e-18 0.00127571133253871 0.00178678067908656 0.00125132812744554 1.71499835203174e-18 -0.00122753335442305 -0.00171947101843372 -0.00120430472255897 -1.98376919236637e-17 0.00118162111648179 0.00165530501659929 0.00115946252035021 1.35287710937962e-17 -0.00113780994765054 -0.00159405592220969 -0.00111664537629129 -7.66364672628507e-18 0.00109595168853359 0.00153551958361185 0.00107571261534299 2.36318426200138e-17 -0.00105591268478657 -0.00147951171867044 -0.00103653717413731 2.84948557440095e-18 0.00101757206537749 0.00142586556988711 0.000999004003823914 1.23451174240951e-17 -0.000980820259621589 -0.00137442988284008 -0.000963008691876980 -2.64492071892457e-17 0.000945557715221390 0.00132506715708933 0.000928456268615373 2.54785616155704e-18 -0.000911693786219901 -0.00127765212763405 -0.000895260170176865 -1.59825969451614e-17 0.000879145765154058 0.00123207044221982 0.000863341334522999 -5.93146107391634e-18 -0.000847838038047993 -0.00118821750563799 -0.000832627410976404 -6.85944686806140e-18 0.000817701344428070 0.00114599746691951 0.000803052066990796 1.87491371610795e-17 -0.000788672127435996 -0.00110532232922019 -0.000774554378476300 1.06620875970405e-18 0.000760691961491630 0.00106611116539495 0.000747078292157979 1.02592419252063e-17 -0.000733707046916517 -0.00102828942489981 -0.000720572150226723 7.92016054273189e-18 0.000707667762550496 0.000991788319848632 0.000694988269019534 2.86156662853525e-18 -0.000682528268740281 -0.000956544279872118 -0.000670282564695535 -1.28868361614294e-17 0.000658246154203898 0.000922498466946177 0.000646414219901794 -3.55349870583547e-18 -0.000634782121214425 -0.000889596342629916 -0.000623345386285588 -5.99088141998022e-18 0.000612099704337419 0.000857787281224063 0.000601040918433775 1.48566248308978e-17 -0.000590165018622356 -0.000827024223263434 -0.000579468135433141 2.01050144230555e-21 0.000568946533710985 0.000797263364521042 0.000558596606763295 8.43653681665974e-18 -0.000548414870803578 -0.000768463876349845 -0.000538397959673987 -1.62641825365923e-17 0.000528542619830215 0.000740587653740096 0.000518845705574256 2.84805777862297e-18 -0.000509304174520250 -0.000713599087941410 -0.000499915083280697 -1.02950450544785e-17 0.000490675583360360 0.000687464860902000 0.000481582917246626 -1.98557623069042e-18 -0.000472634414685000 -0.000662153759123674 -0.000463827489130095 -5.09294479294644e-18 0.000455159634362219 0.000637636504829058 0.000446628421260834 1.16488825754879e-17 -0.000438231494726255 -0.000613885602594416 -0.000429966570742151 -5.88582200874458e-19 0.000421831433570799 0.000590875199823595 0.000413823933074819 6.81531885819744e-18 -0.000405941982158282 -0.000568580959631149 -0.000398183554321459 3.28106378761159e-18 0.000390546681322970 0.000546979944869934 0.000383029450944419 2.62709771311371e-18 -0.000375630004851802 -0.000526050512184024 -0.000368346536549280 -8.08717839966833e-18 0.000361177289420426 0.000505772215094800 0.000354120554852957 -9.73468850454505e-19 -0.000347174670442445 -0.000486125715239045 -0.000340338018271622 -4.20181475958779e-18 0.000333609023261289 0.000467092700975128 0.000326986151589636 8.97200858817413e-18 -0.000320467909176466 -0.000448655812658634 -0.000314052840229652 -8.60388226516153e-19 0.000307739525850392 0.000430798573963826 0.000301526582695045 5.37630187027034e-18 -0.000295412661690531 -0.000413505328693388 -0.000289396446801132 -9.52639993833684e-18 0.000283476653844041 0.000396761182577171 0.000277652029351846 2.28377264371201e-18 -0.000271921349479424 -0.000380551949612198 -0.000266283418953589 -6.20737623732981e-18 0.000260737070063360 0.000364864102541764 0.000255281161689308 -3.51293116007123e-19 -0.000249914578369939 -0.000349684727111959 -0.000244636229403866 -3.35339485558592e-18 0.000239445047985927 0.000335001479779809 0.000234339990376011 6.74626456137664e-18 -0.000229320035098969 -0.000320802548579222 -0.000224384182174613 -9.84280610065372e-18 0.000219531452376130 0.000307076616879367 0.000214760886516132 -4.41702787457067e-18 -0.000210071544758867 -0.000293812829795531 -0.000205462505957763 1.12751393129750e-18 0.000200932867016998 0.000281000763035151 0.000196481742276485 1.88397670747928e-18 -0.000192108262918824 -0.000268630393982072 -0.000187811576397955 -4.63171644465912e-18 0.000183590845887986 0.000256692074840202 0.000179445249751935 7.12956399523918e-18 -0.000175373981029320 -0.000245176507674119 -0.000171376246941885 -9.39098296189004e-18 0.000167451268416827 0.000234074721198764 0.000163598279626824 -1.56968241189864e-18 -0.000159816527546121 -0.000223378049183601 -0.000156105271522279 -8.54474895709097e-19 0.000152463782862659 0.000213078110348440 0.000148891344435506 3.05806892254365e-18 -0.000145387250284631 -0.000203166789638846 -0.000141950805257548 -5.05359494329820e-18 0.000138581324646397 0.000193636220778703 0.000135278133841169 6.85321246682800e-18 -0.000132040567994850 -0.000184478770006217 -0.000128867971700035 1.76519741629733e-18 0.000125759698676517 0.000175687020907568 0.000122715111469625 1.67312407744467e-19 -0.000119733581158677 -0.000167253760269516 -0.000116814487075506 -1.91831842581595e-18 0.000113957216532322 0.000159171964878804 0.000111161164558983 3.49914424390913e-18 -0.000108425733649016 -0.000151434789202038 -0.000105750333514253 -4.92082023020417e-18 0.000103134380847764 0.000144035553885082 0.000100577299094765 -1.79016953168676e-18 -9.80785182312347e-05 -0.000136967735015877 -9.56374745500350e-05 2.62355845524968e-19 9.32536104541540e-05 0.000130224954098995 9.09263742570268e-05 1.11942615614646e-18 -8.86552199894384e-05 -0.000123800968694269 -8.64396072131018e-05 -2.36546624966226e-18 8.42790008403585e-05 0.000117689663675540 8.21728709600800e-05 3.48579155415210e-18 -8.01206926694056e-05 -0.000111885043068878 -7.81219459111724e-05 1.71121088771509e-18 7.61761153168522e-05 0.000106381222432737 7.42826900548401e-05 -5.08823047296271e-19 -7.24411636838527e-05 -0.000101172421745268 -7.06510340113940e-05 -5.79808412737274e-19 6.89118029569579e-05 9.62529587666131e-05 6.72229764200302e-05 1.56403883354697e-18 -6.55840641525109e-05 -9.16172428463366e-05 -6.39945796356077e-05 -2.45298296368096e-18 6.24540399609629e-05 8.72597691482908e-05 6.09619657158936e-05 3.25551952454108e-18 -5.95178808726412e-05 -8.31751132672203e-05 -5.81213126815021e-05 6.37289750232291e-19 5.67717915676878e-05 7.93579262131956e-05 5.54688510318743e-05 2.27637325097982e-19 -5.42120275542178e-05 -7.58029297416484e-05 -5.30008605018807e-05 -1.01666229501961e-18 5.18348920397812e-05 7.25049120083100e-05 5.07136670446644e-05 1.73805344211419e-18 -4.96367330222330e-05 -6.94587235297677e-05 -4.86036400273381e-05 -2.39985779968016e-18 4.76139405871178e-05 6.66592734316511e-05 4.66671896269937e-05 -7.04841574466046e-19 -4.57629443994295e-05 -6.41015259676612e-05 -4.49007644154137e-05 3.11529148050161e-22 4.40802113785144e-05 6.17804972937603e-05 4.33008491215340e-05 6.54159866332479e-19 -4.25622435455570e-05 -5.96912524828578e-05 -4.18639625614806e-05 -1.26604265960095e-18 4.12055760337879e-05 5.78289027662746e-05 4.05866557266451e-05 1.84259655241766e-18 -4.00067752521675e-05 -5.61886029891343e-05 -3.94655100208264e-05 -2.39087321347316e-18 3.89624371939248e-05 5.47655492676406e-05 3.84971356381057e-05 -1.59443148248096e-19 -3.80691858817888e-05 -5.35549768369414e-05 -3.76781700735556e-05 -4.15487514089273e-19 3.73236719423278e-05 5.25521580789748e-05 3.70052767594127e-05 9.70392931450681e-19 -3.67225713022296e-05 -5.17524007203292e-05 -3.64751438197846e-05 -1.51177878218070e-18 3.62625839997808e-05 5.11510461907471e-05 3.60844829373327e-05 2.04595046096463e-18];
%h1 = dfilt.dffir(LPF_LL);
%clear rcTxFilt
%D2 = mean(grpdelay(h1));
%Rx_data_LL_I1 = double(filter(h1,[Rx_data_LL_I; zeros(D2,1)]));

%Rx_data_LL_I1 = Rx_data_LL_I1(D2+1:end);
%{
h1 = dfilt.dffir(Num2);
%clear rcTxFilt
D2 = mean(grpdelay(h1));
Rx_data_LL_I2 = double(filter(h1,[Rx_data_LL_I1; zeros(D2,1)]));

Rx_data_LL_I2 = Rx_data_LL_I2(D2 + 1:end);
%}



Demodout_LL_I = zeros(size(Rx_data_LL_I,1),1);
Rx_data_LL_mod = [Rx_data_LL_I;zeros(number_s,1)];
a = size(Rx_data_LL_I,1);
clear Rx_data_I

for i = 1:a
    Demodout_LL_I(i)= mean(Rx_data_LL_mod(1+(i-1):((i-1)+number_s)));
end
clear Rx_data_LL_mod
b = size(Demodout_LL_I,1);
LL_signal_I = zeros(b/number_s,1);

for i = 1:size(LL_signal_I,1)
    
        LL_signal_I(i) = Demodout_LL_I(1 + (i-1)*4);
end
clear Demodout_LL



%%%%%%%%%%%%%
Demodout_LL_Q = zeros(size(Rx_data_LL_Q,1),1);
Rx_data_LL_mod = [Rx_data_LL_Q;zeros(number_s,1)];
a = size(Rx_data_LL_Q,1);
clear Rx_data_Q

for i = 1:a
    Demodout_LL_Q(i)= mean(Rx_data_LL_mod(1+(i-1):((i-1)+number_s)));
end
clear Rx_data_LL_mod
b = size(Demodout_LL_Q,1);
LL_signal_Q = zeros(b/number_s,1);

for i = 1:size(LL_signal_Q,1)
    
        LL_signal_Q(i) = Demodout_LL_Q(1 + (i-1)*4);
end
clear Demodout_LL_Q
%%%%%%%%%%%%%%





%LL_signal = ((LL_signal_I) - mean(LL_signal_I))/0.38;

LL_signal = (abs(LL_signal_I + 1i*LL_signal_Q) - mean(abs(LL_signal_I + 1i*LL_signal_Q)))/0.254;

 %{
LL_signal1 = reshape(LL_signal,[size(LL_signal,1)/numpackets,numpackets]);

for i = 1:numpackets
LL_signal1(:,i) = LL_signal1(:,i)-mean(LL_signal1(:,i));
end
LL_signal1 = reshape(LL_signal1,[size(LL_signal1,1)*size(LL_signal1,2),1]);

%LL_signal = (LL_signal_I - mean(LL_signal_I))/mean(abs((LL_signal_I - mean(LL_signal_I))));
%}
demodLLR = comm.PSKDemodulator(2,pi,'BitOutput',true,...
    'DecisionMethod','Log-likelihood ratio','Variance',Var);

DemodOut = step(demodLLR,LL_signal);
%{
sigma = 1/(10^(EsNodB/10));
LLR = 0;

LL_1 = 1 + 0i;


LL_0 = -1 + 0i;;



    Dist_1 = exp((-1)*(1/sigma)*((real(LL_signal)-real(LL_1)).^2 + (imag(LL_signal)-imag(LL_1)).^2));



    Dist_0 = exp((-1)*(1/sigma)*((real(LL_signal)-real(LL_0)).^2 + (imag(LL_signal) - imag(LL_0)).^2));



DemodOut = log(Dist_1 ./ Dist_0);




clear Rx
%}
n = zeros(size(LL_signal,1),1);
for i = 1:size(LL_signal,1)
    if LL_signal(i) > 0
        n(i) = 1;
    else
        n(i) = 0;
    end
end

n1 = xor(n,IntrlvrOut_LL);

BER1 = size(find(n1 == 1),1)


%}

