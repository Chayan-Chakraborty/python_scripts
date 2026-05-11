UPDATE project_media_galleries t
JOIN (
    SELECT 2 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/220/insta_assets_crop_a77d1b0e-acbb-4708-bb64-f87759c39ebe7314066931709210651.jpg' AS image_url
    UNION ALL
    SELECT 4 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/220/insta_assets_crop_7b3e7b68-f63d-4d62-80d2-7694ef5522654883306991980927724.jpg' AS image_url
    UNION ALL
    SELECT 5 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/220/insta_assets_crop_84f793b9-41ef-4b64-81ad-707d40b1ff201912271566280387828.jpg' AS image_url
    UNION ALL
    SELECT 14 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7077/insta_assets_crop_18017204-c0e0-438d-a977-0cc37420c8875755707785362051896.jpg' AS image_url
    UNION ALL
    SELECT 16 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7079/scaled_9d4f7ab3-53d0-4339-980f-f9a6d93836e4386317414318307507.jpg' AS image_url
    UNION ALL
    SELECT 19 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_703ec23e-e982-49cf-89ac-c42d8df229cd5098782608806456941.jpg' AS image_url
    UNION ALL
    SELECT 20 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_29ba90f8-397d-4a84-9262-7adb54f1875e6838126530172289790.jpg' AS image_url
    UNION ALL
    SELECT 23 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_6e3413bc-a14d-4a99-9b4f-c7796199abb15945925601705658001.jpg' AS image_url
    UNION ALL
    SELECT 25 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_0dc0fb72-844b-4132-a2f2-1a8883b4015c5049072194975825196.jpg' AS image_url
    UNION ALL
    SELECT 27 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_427054e0-4095-4ae0-8e23-ab2e2a955b661091216365423707919.jpg' AS image_url
    UNION ALL
    SELECT 33 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_ecd92778-97ff-4b16-a873-99a48cd43eb283142379100276947.jpg' AS image_url
    UNION ALL
    SELECT 36 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_0c1798f1-f8d9-4d99-b250-5354ef46f3d61724961751279016983.jpg' AS image_url
    UNION ALL
    SELECT 39 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_6a457bba-06ac-4f1d-804d-026216d172f21132779768950399446.jpg' AS image_url
    UNION ALL
    SELECT 42 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_f03c1e86-0dc4-4b4c-b0e1-13fa1e5e3bca6729068546778367032.jpg' AS image_url
    UNION ALL
    SELECT 43 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_0721a048-bb6a-4b0d-bd1a-66bdf1e433e95282451014606345334.jpg' AS image_url
    UNION ALL
    SELECT 44 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_94d08f21-4538-4b2f-95f7-e526f4152f0f1712781884769789799.jpg' AS image_url
    UNION ALL
    SELECT 45 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_c711ee0a-1cd2-406c-862c-5aab9d2492c8315671070693402915.jpg' AS image_url
    UNION ALL
    SELECT 46 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_88300f8f-cc84-4843-ab3e-fa1f3e27fb6d6751057321777377609.jpg' AS image_url
    UNION ALL
    SELECT 47 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_348f0902-858c-4467-99f1-45dc54fb49e72663818881232213961.jpg' AS image_url
    UNION ALL
    SELECT 48 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_d2cf1455-edc2-4f03-8d1e-e4ec620650bb3545872531238412976.jpg' AS image_url
    UNION ALL
    SELECT 51 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_1e764b86-ff2e-40dc-a333-3fba757939105281730150648124079.jpg' AS image_url
    UNION ALL
    SELECT 52 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_5a6a4e6d-f17a-4095-b45d-8ba2c19aa8131706932859444670596.jpg' AS image_url
    UNION ALL
    SELECT 53 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_4c44bfb0-1d07-4844-b467-92b8b99d79ac691248911523575749.jpg' AS image_url
    UNION ALL
    SELECT 54 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_9a922287-a0b0-4055-92f7-7ca4483d7b545204672578091560963.jpg' AS image_url
    UNION ALL
    SELECT 55 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_3456002e-ad7f-40aa-9b44-be7d54403bfe531813632033141000.jpg' AS image_url
    UNION ALL
    SELECT 56 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_bfd7a4e1-8fa3-4e4c-b0f0-8d35852abcfc9173537983384460079.jpg' AS image_url
    UNION ALL
    SELECT 57 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_c8b7396d-571e-4c0a-be3a-9ddffaf2373c827800057807206755.jpg' AS image_url
    UNION ALL
    SELECT 58 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7064/insta_assets_crop_a3056b37-01bb-45ef-8d6b-43a05a99d5bf3803061871312085331.jpg' AS image_url
    UNION ALL
    SELECT 59 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7082/insta_assets_crop_72061b22-c0a4-431a-8555-afa85298729b6789602604361818266.jpg' AS image_url
    UNION ALL
    SELECT 60 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/21/insta_assets_crop_4254a167-c1b2-4f31-a2db-b7e8ef3e3ce86816704769626620346.jpg' AS image_url
    UNION ALL
    SELECT 61 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/21/insta_assets_crop_220a64b4-bdb0-47e3-b8c2-22d476b0029f4347254244646451102.jpg' AS image_url
    UNION ALL
    SELECT 62 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/21/insta_assets_crop_67fdbaef-0675-43a8-9df8-082692598bb11283642690769033384.jpg' AS image_url
    UNION ALL
    SELECT 63 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/21/insta_assets_crop_0096d62a-689e-4c06-8d92-17b480374dc87809693158826885385.jpg' AS image_url
    UNION ALL
    SELECT 64 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/21/insta_assets_crop_f7cf0a54-7eba-4647-bcb8-20192cd6fbe77660095264566719016.jpg' AS image_url
    UNION ALL
    SELECT 65 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7083/insta_assets_crop_798a5e55-c359-4879-98f9-11e580c9a6c6847214256164972580.jpg' AS image_url
    UNION ALL
    SELECT 66 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7084/insta_assets_crop_21269c1c-8d6a-4bfd-837d-3413e38170713942833957209479368.jpg' AS image_url
    UNION ALL
    SELECT 67 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7085/insta_assets_crop_7ee958e0-eabd-4470-bfde-012c557ed813273714398669444055.jpg' AS image_url
    UNION ALL
    SELECT 68 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7086/insta_assets_crop_3e7fc665-d873-4ee8-8c36-19ede716b89e5205956722233671748.jpg' AS image_url
    UNION ALL
    SELECT 69 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7086/insta_assets_crop_2aaf9b44-c68e-4eee-91cc-26817a21c7c24463569301741358858.jpg' AS image_url
    UNION ALL
    SELECT 70 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7087/insta_assets_crop_29d68258-c6a5-48d9-91bf-0a1f03cef847350390047558897367.jpg' AS image_url
    UNION ALL
    SELECT 72 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/308/insta_assets_crop_a7716248-ba55-4601-a2c7-d848f2090def1484505118896285135.jpg' AS image_url
    UNION ALL
    SELECT 73 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/308/insta_assets_crop_49acbebc-3424-45f6-8982-9b40071a43e93011237654957643594.jpg' AS image_url
    UNION ALL
    SELECT 76 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/308/insta_assets_crop_63dc3e99-8a94-4b8b-972b-620f4df840944992301511678435714.jpg' AS image_url
    UNION ALL
    SELECT 77 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7089/insta_assets_crop_f6e96ff8-f005-4b20-9ae5-601fdc1fc5f37803720173963661348.jpg' AS image_url
    UNION ALL
    SELECT 79 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7089/insta_assets_crop_dcf6d0c0-66f2-491f-81c0-e63c5b5b28a68295166873289981170.jpg' AS image_url
    UNION ALL
    SELECT 81 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5776/insta_assets_crop_a35a61c6-d481-4460-a5db-bab9b6bde86b7405244479319893180.jpg' AS image_url
    UNION ALL
    SELECT 82 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5776/insta_assets_crop_a5fdbd88-3a03-4728-a3ef-ff86ee38abdb4655029656086310956.jpg' AS image_url
    UNION ALL
    SELECT 83 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5776/insta_assets_crop_4e03e9d7-ad82-4882-815d-e78df1d887796026209712801523212.jpg' AS image_url
    UNION ALL
    SELECT 85 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/308/insta_assets_crop_8902e854-be8c-441d-8e71-b8b9ac2a73dd7690067631232747998.jpg' AS image_url
    UNION ALL
    SELECT 86 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/308/insta_assets_crop_295e073f-fe62-4ac8-8e9c-4d6c98262b443509284187104738403.jpg' AS image_url
    UNION ALL
    SELECT 87 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/308/insta_assets_crop_77698237-14b4-4a98-be8b-f71c122f23758452348894803086751.jpg' AS image_url
    UNION ALL
    SELECT 88 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/308/insta_assets_crop_52961d69-cb03-4f44-a310-47814afd8cb58345412170665757350.jpg' AS image_url
    UNION ALL
    SELECT 89 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/308/insta_assets_crop_b9b7b5b0-96b3-4dec-8881-6ea840cfc4425388072038202008277.jpg' AS image_url
    UNION ALL
    SELECT 90 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_f0000191-2767-4927-8300-a28b4cf2be553458452119110030200.jpg' AS image_url
    UNION ALL
    SELECT 91 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_5f99f92d-0e20-4641-beea-fe68b9c646531693503430818559016.jpg' AS image_url
    UNION ALL
    SELECT 94 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_ab5642fc-504b-47ea-a031-be439603432d4002799537386053218.jpg' AS image_url
    UNION ALL
    SELECT 95 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_b54752b5-6c44-454f-a9f1-0e5728a2f1412453290839278380598.jpg' AS image_url
    UNION ALL
    SELECT 97 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_bdbe604e-c0fe-4701-a8e9-bbe6f9205d445254139203915501684.jpg' AS image_url
    UNION ALL
    SELECT 98 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/308/insta_assets_crop_768208d0-ff55-444e-b4b4-8a7f082a07451486243739699425641.jpg' AS image_url
    UNION ALL
    SELECT 100 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_dc66f1d9-a461-479f-959c-908f219534b18430466860644498950.jpg' AS image_url
    UNION ALL
    SELECT 101 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/308/insta_assets_crop_a98f14cf-da40-4d67-97d7-85f780860a0f2043937862876327818.jpg' AS image_url
    UNION ALL
    SELECT 102 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/308/insta_assets_crop_fcf0f63c-f8b3-4c7d-adf5-fe2bf159ffe94741208614137602433.jpg' AS image_url
    UNION ALL
    SELECT 103 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/308/insta_assets_crop_f1ddc280-aa6f-469b-9442-0e862c8828de7935662864289171127.jpg' AS image_url
    UNION ALL
    SELECT 104 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/308/insta_assets_crop_026b65d9-da1b-40a0-89ef-e8d39d2783dc846821810328677930.jpg' AS image_url
    UNION ALL
    SELECT 105 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_215c7cdf-5fdd-4cf2-9050-c33f3270fc5a4221122915398520303.jpg' AS image_url
    UNION ALL
    SELECT 106 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_5ba4f9e1-13ed-4bb0-915a-c818dc8d94e46026518125110391401.jpg' AS image_url
    UNION ALL
    SELECT 108 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_7e66cb38-c45c-4ac9-8c70-33889ac96dde633711648889890132.jpg' AS image_url
    UNION ALL
    SELECT 109 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_dd085ae3-0a66-4205-92c3-457ef2b646cd8527055621446034871.jpg' AS image_url
    UNION ALL
    SELECT 110 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_0d275f82-3d1f-44a2-8c6c-226825eb95ec57588480812811034.jpg' AS image_url
    UNION ALL
    SELECT 111 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_2df7386d-9c5b-4c39-a9cf-ff19faef3d163573357836976655186.jpg' AS image_url
    UNION ALL
    SELECT 112 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_349a0980-f7c7-4142-8a70-90a9c214589e6258538200898665189.jpg' AS image_url
    UNION ALL
    SELECT 113 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_b9ae48a0-12f7-4224-8c0b-d8a8166f3e1e1904786373695161215.jpg' AS image_url
    UNION ALL
    SELECT 114 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_236f85c7-a4f4-487b-8cbb-333829a26f1b9223269537075772043.jpg' AS image_url
    UNION ALL
    SELECT 115 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_2dae15fd-7b2a-45cf-b01e-3c2803e756c08892217764794212438.jpg' AS image_url
    UNION ALL
    SELECT 116 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_2cc59d55-ce46-456b-8894-3db861b1b8118105946491762846880.jpg' AS image_url
    UNION ALL
    SELECT 117 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_067691da-38e5-489f-9025-fdf83dfd34416166515846008885650.jpg' AS image_url
    UNION ALL
    SELECT 118 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_89ebf0aa-ff4c-49be-8af3-0eb413b4aa347940083846545210264.jpg' AS image_url
    UNION ALL
    SELECT 119 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_c79ed1c9-493a-4bf5-9c1e-5af031a09c747827638549931012999.jpg' AS image_url
    UNION ALL
    SELECT 120 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_e7279c44-0ddc-4b9b-9cc8-9cdc0be4dccf4534994673604918250.jpg' AS image_url
    UNION ALL
    SELECT 121 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_639f81ae-c491-4404-8e46-acd645c305575851776680488230853.jpg' AS image_url
    UNION ALL
    SELECT 122 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_3dabf78a-3f86-4a41-bc4e-2e81128d41667942269850335435959.jpg' AS image_url
    UNION ALL
    SELECT 123 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_79f8e75e-1467-420e-a15f-f252a2d307371109744880127308943.jpg' AS image_url
    UNION ALL
    SELECT 124 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_e33d1dad-70e4-4d2c-aed7-d9918d04d0421963888580326790671.jpg' AS image_url
    UNION ALL
    SELECT 125 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_23c8ed1d-e3a3-47af-acd3-e1f64ac792971479065641071628378.jpg' AS image_url
    UNION ALL
    SELECT 126 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_9aad30ae-18c6-46fd-ae74-d6856424b9732363132732321734017.jpg' AS image_url
    UNION ALL
    SELECT 127 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_4853cc88-b71c-4729-9c8c-352eddd83eca6649884164236692805.jpg' AS image_url
    UNION ALL
    SELECT 128 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_db6809e0-bb95-4d2d-b14f-7fcdd7d5b7df9089301897875121974.jpg' AS image_url
    UNION ALL
    SELECT 129 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_47a5fbf6-f37f-413a-8802-455f1d3125308698050017773594922.jpg' AS image_url
    UNION ALL
    SELECT 130 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_5f7a3e7f-ea5d-4339-b1da-175f905e4b162476866896721730601.jpg' AS image_url
    UNION ALL
    SELECT 131 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_4d35bdac-b2cb-4aad-933e-288e235168a75463598649800100859.jpg' AS image_url
    UNION ALL
    SELECT 132 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_c4d8ee8a-1242-4e55-b361-9c3ef6ab98646981051093168847166.jpg' AS image_url
    UNION ALL
    SELECT 133 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_937cefbf-a729-4dae-aec6-b055cca96e73342844641550222886.jpg' AS image_url
    UNION ALL
    SELECT 134 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_a353a385-26fe-4752-94aa-a85406974baa7122988494924848352.jpg' AS image_url
    UNION ALL
    SELECT 135 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_addfa053-1e58-4d05-96ee-784d7b97e8d9822129340627025478.jpg' AS image_url
    UNION ALL
    SELECT 136 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_43951e94-75ee-4309-aebf-aee2c510a3315358059349517986823.jpg' AS image_url
    UNION ALL
    SELECT 139 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_791b4c79-293a-44a4-a1ed-4be8fba100268506518565533348208.jpg' AS image_url
    UNION ALL
    SELECT 140 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_62c36f54-d431-40dc-93fb-ad38c092f9792714447435533634919.jpg' AS image_url
    UNION ALL
    SELECT 141 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7090/insta_assets_crop_e9bf7bee-de27-49be-9b30-564af32a8ae24898508773188766526.jpg' AS image_url
    UNION ALL
    SELECT 142 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_09475582-1565-49c6-af54-46683a1f01794021003282513915857.jpg' AS image_url
    UNION ALL
    SELECT 143 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_45a81ac2-f97e-4eef-b235-ac00f7e1668a8080476865912685684.jpg' AS image_url
    UNION ALL
    SELECT 144 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_0105c27c-ee1b-4d4c-b4d5-29c62debc7a78948953471720253941.jpg' AS image_url
    UNION ALL
    SELECT 145 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_b57a4a55-07fe-47c0-a097-89b5bc7a7ac2296306509987371295.jpg' AS image_url
    UNION ALL
    SELECT 146 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_910f9825-26cc-404a-aaf4-b97cd4dd83183759269860146796371.jpg' AS image_url
    UNION ALL
    SELECT 147 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7090/insta_assets_crop_975a52df-cc0c-482d-bd01-0b7e3dc9a8298615526599943321130.jpg' AS image_url
    UNION ALL
    SELECT 148 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_1991c637-c5f4-48fd-aa8f-e9042434f4ac494626747076316508.jpg' AS image_url
    UNION ALL
    SELECT 149 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_fc3f1426-d869-422d-a655-d5312259ea977493825075054859514.jpg' AS image_url
    UNION ALL
    SELECT 150 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_4fcebd69-bd4d-4096-8d33-febb016d16026445353689751366710.jpg' AS image_url
    UNION ALL
    SELECT 151 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_708148ec-9b4d-4137-9cdb-b1087d65960d4963591426766959348.jpg' AS image_url
    UNION ALL
    SELECT 152 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_5bf7d446-68df-4144-9199-64a0f85bd4e52159158308206392172.jpg' AS image_url
    UNION ALL
    SELECT 153 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7090/insta_assets_crop_a042eec2-5884-4bbc-b432-ee4c69809c448405750367544090348.jpg' AS image_url
    UNION ALL
    SELECT 154 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_3686a2a8-8d14-4a99-88bd-c0fc90dad7696416546531087060488.jpg' AS image_url
    UNION ALL
    SELECT 155 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_c52b1e4e-579f-4858-87b5-b5f082f895078033880888831025498.jpg' AS image_url
    UNION ALL
    SELECT 156 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_681ad2dc-3ad8-4a49-b5fd-de2c31061cfa1977530701805039718.jpg' AS image_url
    UNION ALL
    SELECT 157 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_787a72ed-f452-4173-8e80-66f08357231c2724910431269542267.jpg' AS image_url
    UNION ALL
    SELECT 158 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7057/insta_assets_crop_914331e6-d246-4279-ad4e-1154a6389b69111223258608391660.jpg' AS image_url
    UNION ALL
    SELECT 184 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7093/insta_assets_crop_376ac854-7360-454a-95d3-09c78461350d6408222580460792932.jpg' AS image_url
    UNION ALL
    SELECT 185 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7093/insta_assets_crop_1519a5e2-2103-4948-b8c4-93afdc7dc2e98077912743470665612.jpg' AS image_url
    UNION ALL
    SELECT 187 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7052/insta_assets_crop_bb0b0329-503d-46b6-afe0-1e61945742cd7632661065029382022.jpg' AS image_url
    UNION ALL
    SELECT 188 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7052/insta_assets_crop_b1c87598-ee64-499e-9fbf-86afe2e82c628815005820332445508.jpg' AS image_url
    UNION ALL
    SELECT 193 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7094/insta_assets_crop_aace2e77-18fa-4fdc-812a-ff890ac59db2672863390543198877.jpg' AS image_url
    UNION ALL
    SELECT 194 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6927/insta_assets_crop_5b2e1b5a-ecd5-45e7-89ea-4d1ac64a0994208608747773288717.jpg' AS image_url
    UNION ALL
    SELECT 195 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7095/insta_assets_crop_294a6252-99b0-4fc9-8ae4-5d41f8ebfdbc8904126304561854487.jpg' AS image_url
    UNION ALL
    SELECT 202 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4369/insta_assets_crop_fdff2446-0975-4ab8-b4cf-da67d461c3f52925357951467033406.jpg' AS image_url
    UNION ALL
    SELECT 203 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4369/insta_assets_crop_27089dbe-3f3a-4979-914c-54177b87114f3948270829212424003.jpg' AS image_url
    UNION ALL
    SELECT 204 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4369/insta_assets_crop_02287461-5023-4097-8727-4ed83ff6301b7828562309464931784.jpg' AS image_url
    UNION ALL
    SELECT 205 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7096/insta_assets_crop_a30ecefc-eefe-4cc3-97d3-3bf5c4cd298b6343036746818826913.jpg' AS image_url
    UNION ALL
    SELECT 222 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7088/insta_assets_crop_9ec7b093-03ff-4813-82e8-902f5e1890021581142435517473139.jpg' AS image_url
    UNION ALL
    SELECT 226 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7099/insta_assets_crop_876d1af5-8bc5-4175-a960-5e2df4223157418428405924184425.jpg' AS image_url
    UNION ALL
    SELECT 227 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7099/insta_assets_crop_6e70134b-86fe-4e58-95db-f9ca6d5f19152856545838726927959.jpg' AS image_url
    UNION ALL
    SELECT 228 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7092/insta_assets_crop_7ab0ec7c-b7e6-48d6-b63d-a051172da3f72232600669971392468.jpg' AS image_url
    UNION ALL
    SELECT 229 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6653/image_cropper_BC9931F5-A28A-4D26-8738-B82E20C13E5E-9950-000005EAF7F20634.jpg' AS image_url
    UNION ALL
    SELECT 230 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7092/insta_assets_crop_5b764378-aca4-491b-b3a4-ece2ea62fbc6529050487056135124.jpg' AS image_url
    UNION ALL
    SELECT 231 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7092/insta_assets_crop_44812893-d1dd-45ff-ab8c-16f497360f7f2540635923787201218.jpg' AS image_url
    UNION ALL
    SELECT 232 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7092/insta_assets_crop_1fa85604-15ea-487a-b582-ee7a977d88243328979655669182443.jpg' AS image_url
    UNION ALL
    SELECT 233 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7092/insta_assets_crop_c2e2756e-83ad-4612-81c3-615f09b7d4995913207127270602917.jpg' AS image_url
    UNION ALL
    SELECT 234 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7092/insta_assets_crop_5506b605-353a-4ff7-891a-42ce46437378754785279289805268.jpg' AS image_url
    UNION ALL
    SELECT 235 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3237/insta_assets_crop_1c263ff7-479d-4575-8c23-e6e3c2b15d867429569858267749535.jpg' AS image_url
    UNION ALL
    SELECT 236 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_301326d1-054e-412c-9966-9a476f7144692594091374311972261.jpg' AS image_url
    UNION ALL
    SELECT 239 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_a4cc80c2-f218-4423-b016-5ec16c8e18331517401515282108982.jpg' AS image_url
    UNION ALL
    SELECT 240 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1651/insta_assets_crop_b48a047e-56dd-40c9-b5c0-dacf529a0553880972588892324856.jpg' AS image_url
    UNION ALL
    SELECT 241 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_df738626-4429-46a5-95d8-b6d0be370ee98932421344241466953.jpg' AS image_url
    UNION ALL
    SELECT 242 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_fbc954b7-ec4d-4285-ac44-f4c79cd8bb5b8895839170688766573.jpg' AS image_url
    UNION ALL
    SELECT 243 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_1ca6e501-4b1e-4537-8175-67dcb312247e3163773649601452575.jpg' AS image_url
    UNION ALL
    SELECT 244 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_c4069a97-b090-4f71-818d-6134ede0a8b3639413183088624345.jpg' AS image_url
    UNION ALL
    SELECT 245 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_6a222961-fad4-4611-b405-4d08859d20382482964870908675248.jpg' AS image_url
    UNION ALL
    SELECT 246 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_98a5a6d2-e382-4df1-a697-a7ef1939f5f14844161560591861429.jpg' AS image_url
    UNION ALL
    SELECT 247 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_dd921e77-48b7-4bb5-9dea-d77ee45dadfc2372607533312222735.jpg' AS image_url
    UNION ALL
    SELECT 248 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_a260c10b-df2e-45e0-b279-a86a913a04775160469493353933833.jpg' AS image_url
    UNION ALL
    SELECT 249 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_bf2e39c0-821b-4700-bc7f-5e9849d86fcc5271063960020828832.jpg' AS image_url
    UNION ALL
    SELECT 250 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_1a2f45e3-61f2-4550-ad35-ee5b400ba0013172965053259245659.jpg' AS image_url
    UNION ALL
    SELECT 251 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_edf8c938-90ff-4248-84c8-6bbb13c7863b5055441091540417362.jpg' AS image_url
    UNION ALL
    SELECT 252 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_4b5cb4e8-8d78-4243-9436-ffaa638893ed3310891452633451935.jpg' AS image_url
    UNION ALL
    SELECT 253 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_64459749-9e1f-48a9-a24b-9f1cd9ab95a95814203855826045217.jpg' AS image_url
    UNION ALL
    SELECT 254 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_204b0093-39e9-4215-a073-af698168c3dd644393560465730322.jpg' AS image_url
    UNION ALL
    SELECT 255 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_0eb54c5a-1b1e-452c-8e07-213bfe98303d3658439052811833959.jpg' AS image_url
    UNION ALL
    SELECT 256 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_93758198-88be-4e9e-aa5e-1b2c9b1f8a8c5177560374255811339.jpg' AS image_url
    UNION ALL
    SELECT 257 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_3d1d34bf-7f82-43f4-b083-0c17b627089e1599344456224014992.jpg' AS image_url
    UNION ALL
    SELECT 258 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_016f1308-1a62-4527-a72b-d4815c3d22fd2099652379649462381.jpg' AS image_url
    UNION ALL
    SELECT 259 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_526f19dd-d3c6-4045-9eed-36122e51a3b06626204421351756083.jpg' AS image_url
    UNION ALL
    SELECT 260 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_7d79dd52-bebb-4f53-aba4-8fd8a6182d9c7912058230073245837.jpg' AS image_url
    UNION ALL
    SELECT 261 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_d4d2afff-1885-4685-8789-957263e3b00a1358088607169783506.jpg' AS image_url
    UNION ALL
    SELECT 262 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_f388b1a7-780a-4976-b804-20f24ddfd1757537982342166816344.jpg' AS image_url
    UNION ALL
    SELECT 263 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_6581c806-a48b-492c-afac-94a142c89fab3945633383350765152.jpg' AS image_url
    UNION ALL
    SELECT 264 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_78cbc319-0cd2-470c-8644-9030ca55adbd3389631761315851192.jpg' AS image_url
    UNION ALL
    SELECT 272 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6859/insta_assets_crop_6f0a1750-d4a2-45f7-b433-7adfbef2b4cc8665573368914836266.jpg' AS image_url
    UNION ALL
    SELECT 273 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_8f92e923-be8b-4137-b393-17c5ab0dbe671109670222610658423.jpg' AS image_url
    UNION ALL
    SELECT 276 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_c2455b3b-513f-49aa-be53-45a6b99d00387252756969056478317.jpg' AS image_url
    UNION ALL
    SELECT 277 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_9ec9e0cd-4f7d-4699-9b78-35b9ac147e055979768954800256043.jpg' AS image_url
    UNION ALL
    SELECT 280 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_1281b806-cea7-4388-9ece-927f2f14b0b22914185530406081625.jpg' AS image_url
    UNION ALL
    SELECT 285 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_88a49ce5-c3f2-41df-bea3-c701daecdadc1693916667394187055.jpg' AS image_url
    UNION ALL
    SELECT 287 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_9b310bf7-9ec8-4ae4-a1ad-e0b6fb8c1ecd5086080996044734641.jpg' AS image_url
    UNION ALL
    SELECT 308 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_ec46b11e-dca7-41f6-a547-cf55fc462eed8862661781217916656.jpg' AS image_url
    UNION ALL
    SELECT 309 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_454ab786-fab1-4d5f-9c57-c13d8fe1fafe5295749398100629757.jpg' AS image_url
    UNION ALL
    SELECT 310 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_509c66cf-cdf1-4c87-94a2-f7bf007bb6798851954411453282602.jpg' AS image_url
    UNION ALL
    SELECT 311 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_81857a58-f804-4642-994e-5ea53e6711d97557527614639700500.jpg' AS image_url
    UNION ALL
    SELECT 312 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_5813a814-177d-41d6-96ab-ff5e568397342893200565502335933.jpg' AS image_url
    UNION ALL
    SELECT 349 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_23aa4194-af87-4461-8d8b-72bf864397385795042304042329923.jpg' AS image_url
    UNION ALL
    SELECT 354 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7105/insta_assets_crop_c799590f-ff7a-4856-8999-21503ef6f1612312815120172645363.jpg' AS image_url
    UNION ALL
    SELECT 355 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7105/insta_assets_crop_e09fbd0a-e750-4af9-aa60-5a9131c33ae33102585581786793818.jpg' AS image_url
    UNION ALL
    SELECT 356 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7102/insta_assets_crop_46a96ca8-16f9-4f38-b7cc-774da6ac34df1978576985728715487.jpg' AS image_url
    UNION ALL
    SELECT 357 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_aa52ec74-61c7-4461-b157-b6bd40f0f25c596952177009923992.jpg' AS image_url
    UNION ALL
    SELECT 358 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_7c478012-1867-4f00-a435-3b9bacede97d23117475582398228.jpg' AS image_url
    UNION ALL
    SELECT 359 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_56e89f8f-ff36-40de-8345-28fc6da97d5d9151614323655363009.jpg' AS image_url
    UNION ALL
    SELECT 360 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5956/insta_assets_crop_d1eeaf6e-7058-422f-b66f-dcce91eb5aa93049466351892433630.jpg' AS image_url
    UNION ALL
    SELECT 361 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5776/insta_assets_crop_6b5dc2a3-a6b3-46aa-b8d0-1bdb30b7c1415029865561870144011.jpg' AS image_url
    UNION ALL
    SELECT 362 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5846/image_cropper_B0EE6593-72A0-4917-87B9-A4811E87E1D7-4992-000003839D75407F.jpg' AS image_url
    UNION ALL
    SELECT 363 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5846/image_cropper_A77B2C42-8484-4A78-AC69-832119E42F9F-4992-00000383E998F60B.jpg' AS image_url
    UNION ALL
    SELECT 364 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5846/image_cropper_19A11754-09E1-41FE-8312-0E81F5217E5E-4992-00000384688D921C.jpg' AS image_url
    UNION ALL
    SELECT 373 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5846/image_cropper_B258E854-3335-4F5C-AFB7-6A7DBC693726-4992-0000038BB4687550.jpg' AS image_url
    UNION ALL
    SELECT 374 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5320/insta_assets_crop_1f02f2e5-acbc-4a53-a996-049d27b2ec0b1775540378067216585.jpg' AS image_url
    UNION ALL
    SELECT 379 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3996/insta_assets_crop_3e1f3b26-1580-4ced-9b3d-f0a0067acd612892962500760712066.jpg' AS image_url
    UNION ALL
    SELECT 380 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7112/scaled_671490b4-f7d8-4ae6-8d5c-15429bad79194283339780078318888.jpg' AS image_url
    UNION ALL
    SELECT 391 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7115/insta_assets_crop_030923ba-ae2f-45f4-86dd-0ea36b6248d43324142367442530550.jpg' AS image_url
    UNION ALL
    SELECT 393 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7117/insta_assets_crop_21c0d466-ff92-4c4b-89f1-e1d5593b10b5842665601331206703.jpg' AS image_url
    UNION ALL
    SELECT 395 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7117/insta_assets_crop_42366613-7f43-414d-9863-39152875024a4081147317110568147.jpg' AS image_url
    UNION ALL
    SELECT 396 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7117/insta_assets_crop_6c082296-77db-4e87-95db-df938e1ce9b59193126072718081179.jpg' AS image_url
    UNION ALL
    SELECT 397 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7117/insta_assets_crop_72186617-9136-442b-b541-f750e73bcf966394723763955369925.jpg' AS image_url
    UNION ALL
    SELECT 398 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7118/scaled_f5cb1a4a-6b07-4d21-8459-8793fefb98741026222029603465467.jpg' AS image_url
    UNION ALL
    SELECT 399 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5401/insta_assets_crop_5c74e25e-bbbc-4222-9a18-bd505f7825996611336112157037279.jpg' AS image_url
    UNION ALL
    SELECT 400 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7122/insta_assets_crop_d34dbd7d-a7b6-4c3a-9b97-665af76af4747448786517997169098.jpg' AS image_url
    UNION ALL
    SELECT 401 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7121/insta_assets_crop_b54b07e2-4bbe-44e6-96de-35c7456594a56026202285348034593.jpg' AS image_url
    UNION ALL
    SELECT 402 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7121/insta_assets_crop_96c3d5df-a7ae-44c7-a296-dae04ce8e3eb8235170994615508088.jpg' AS image_url
    UNION ALL
    SELECT 403 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7121/insta_assets_crop_55401b39-d37f-4cf0-8417-8f687a398c9c6476696676360817287.jpg' AS image_url
    UNION ALL
    SELECT 404 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7121/insta_assets_crop_438901a3-58a9-4c46-acaa-cc6d4e3209396025232961005842254.jpg' AS image_url
    UNION ALL
    SELECT 405 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2539/insta_assets_crop_209c65d3-87e7-45ad-b9f2-3b93e450460a1442693974753712944.jpg' AS image_url
    UNION ALL
    SELECT 406 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7124/insta_assets_crop_032a023b-fb51-4ae6-80c8-109b25309d2d164609361544667437.jpg' AS image_url
    UNION ALL
    SELECT 407 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7124/insta_assets_crop_72bce454-7e8f-44b0-96d2-462094501b033693364305851643537.jpg' AS image_url
    UNION ALL
    SELECT 408 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6353/insta_assets_crop_635f7f32-43f7-45e4-b820-e0d9aae9f69e1527658622495561356.jpg' AS image_url
    UNION ALL
    SELECT 409 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6353/insta_assets_crop_289828e5-591e-452e-a30f-c3d6f62c3d117227985553229685649.jpg' AS image_url
    UNION ALL
    SELECT 410 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6353/insta_assets_crop_6c140771-5670-4324-90d4-9feecbd4cd706837053303311872686.jpg' AS image_url
    UNION ALL
    SELECT 411 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6353/insta_assets_crop_dd99d255-2b44-4d8a-bf23-7dcb185fa40a485512456773041992.jpg' AS image_url
    UNION ALL
    SELECT 412 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6353/insta_assets_crop_ed95e59f-3d15-4c31-8aa9-9149e17229176718421244710615641.jpg' AS image_url
    UNION ALL
    SELECT 413 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6353/insta_assets_crop_d4a3d651-a4b3-4d48-bb75-e9e7f7c89d50326996438744809520.jpg' AS image_url
    UNION ALL
    SELECT 414 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6353/insta_assets_crop_c36b831e-7448-45e3-9baa-429add198b6b397402425824571799.jpg' AS image_url
    UNION ALL
    SELECT 416 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6353/insta_assets_crop_f0275b8b-faf1-4de1-bc66-b62f7cc423121616392325564529504.jpg' AS image_url
    UNION ALL
    SELECT 417 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6353/insta_assets_crop_c8cc4940-6408-46d9-99b3-a3be6f3f9721630240920155961257.jpg' AS image_url
    UNION ALL
    SELECT 418 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7125/insta_assets_crop_92182c08-0162-42ec-b355-b3044691cc9b7879153565768181023.jpg' AS image_url
    UNION ALL
    SELECT 422 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7130/insta_assets_crop_dbae745b-d931-4e75-af3a-c55f2d194bd01445584290042540798.jpg' AS image_url
    UNION ALL
    SELECT 443 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7137/insta_assets_crop_5de0bd92-5d3b-4ea7-9554-b07fbaccd48a950843188188986924.jpg' AS image_url
    UNION ALL
    SELECT 453 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7144/insta_assets_crop_64785765-ca9e-4ae4-9544-1b05ae0d73a3213012942255247675.jpg' AS image_url
    UNION ALL
    SELECT 454 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7144/insta_assets_crop_6c215cac-8343-4f3d-a926-790d442a1f6e2373052722380012207.jpg' AS image_url
    UNION ALL
    SELECT 455 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7146/insta_assets_crop_01b0e241-81da-4ed1-a6de-ff440dfaa7363211107980579885684.jpg' AS image_url
    UNION ALL
    SELECT 456 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7147/insta_assets_crop_2cac5616-bb5f-45d4-bb36-c0598eb228992568324038468824839.jpg' AS image_url
    UNION ALL
    SELECT 457 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7147/insta_assets_crop_1b2565f3-42a1-4271-b4d6-038745fa9c886766893583611485507.jpg' AS image_url
    UNION ALL
    SELECT 458 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7147/insta_assets_crop_11ee28c5-0c6a-484f-9d93-ac256f7e5f681803165774121343017.jpg' AS image_url
    UNION ALL
    SELECT 459 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7147/insta_assets_crop_c9db6c18-97ba-4e0a-9550-3ecf848b3ddb7122103978153394389.jpg' AS image_url
    UNION ALL
    SELECT 460 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7147/insta_assets_crop_cf72a955-9ad8-4e4d-9159-e887c5f8cb154486316682382778111.jpg' AS image_url
    UNION ALL
    SELECT 461 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7148/image_cropper_FE0FC783-AF82-477D-B6EB-55FCF22AA2AE-36675-0000150BF637D90D.jpg' AS image_url
    UNION ALL
    SELECT 462 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7148/image_cropper_E2C8A9B9-D049-4BCC-AD6A-DDE82FED62BB-36675-0000150C57F30A60.jpg' AS image_url
    UNION ALL
    SELECT 463 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7148/image_cropper_C7D984DF-3925-4880-A5D3-51B7C1398D86-36675-0000150C836A77A9.jpg' AS image_url
    UNION ALL
    SELECT 464 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7148/image_cropper_FCBD0EC9-287C-4EA4-B799-633131706A62-36675-0000150CE51B15A6.jpg' AS image_url
    UNION ALL
    SELECT 465 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7148/image_cropper_9D248014-83A5-46C1-B44F-88C327A2E42C-36675-0000150D676D5C0F.jpg' AS image_url
    UNION ALL
    SELECT 466 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7148/image_cropper_E40BC121-D418-444F-8A7B-1DC161F93D7A-36675-0000150D82768265.jpg' AS image_url
    UNION ALL
    SELECT 467 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7148/image_cropper_FA07AFCD-7C04-4B4B-AA5A-7DC2C9383EA7-36675-0000150D9E16FFB7.jpg' AS image_url
    UNION ALL
    SELECT 488 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7155/image_cropper_B2D9B99B-5AE1-4291-A58C-E4E14BC5CBD8-9786-000004C6410F7242.jpg' AS image_url
    UNION ALL
    SELECT 489 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1805/insta_assets_crop_d7f1843a-314b-4d77-97a1-165c58ac6f182014414814541854484.jpg' AS image_url
    UNION ALL
    SELECT 504 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1463/insta_assets_crop_236716e5-c119-4f36-ad20-f97303c7d4337797840046070353976.jpg' AS image_url
    UNION ALL
    SELECT 506 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1463/insta_assets_crop_264800b8-46ed-4006-b387-b301a62c426d8996044808269826712.jpg' AS image_url
    UNION ALL
    SELECT 507 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1463/insta_assets_crop_2c7deb7f-ff19-4499-be61-5c220ed3197b705819301239766081.jpg' AS image_url
    UNION ALL
    SELECT 508 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1463/insta_assets_crop_2e4bc6f8-897c-40ec-abe9-87edfaaa28b03490528179485920009.jpg' AS image_url
    UNION ALL
    SELECT 509 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1463/insta_assets_crop_6b40b22c-3f52-4bf2-b9ff-6e31536ffd183522095810731365889.jpg' AS image_url
    UNION ALL
    SELECT 510 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1463/insta_assets_crop_30b34500-ba1a-4815-bff2-459dd93070d53421127014153206472.jpg' AS image_url
    UNION ALL
    SELECT 511 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1463/insta_assets_crop_7e46c72b-0fe4-47c6-8b77-1128a869f6556727208917872472538.jpg' AS image_url
    UNION ALL
    SELECT 512 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1463/insta_assets_crop_41bbaa4b-2a68-43f5-8953-3e83af8543762535318762654980139.jpg' AS image_url
    UNION ALL
    SELECT 513 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1463/insta_assets_crop_64322559-0013-4c67-bd1d-97916069261e8554195017552991644.jpg' AS image_url
    UNION ALL
    SELECT 514 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7158/insta_assets_crop_00b4056e-e488-4304-ba12-fea85783b8a26014611433912085225.jpg' AS image_url
    UNION ALL
    SELECT 515 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4280/insta_assets_crop_4a206e80-6843-4ef6-9354-b71745cd7f03859059241820431624.jpg' AS image_url
    UNION ALL
    SELECT 516 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_823343f2-3c9f-4d1c-913a-03baf2899dc74241602006252231341.jpg' AS image_url
    UNION ALL
    SELECT 517 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_8c448e7f-a2f2-4079-a198-c15feb475f2b297745973588161146.jpg' AS image_url
    UNION ALL
    SELECT 518 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_41ef9ef6-d8a7-4195-b5d0-82ab81af68212981978913282955110.jpg' AS image_url
    UNION ALL
    SELECT 519 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_1d2af4c5-60fd-4558-964f-9d0e0725d4238941143619089506778.jpg' AS image_url
    UNION ALL
    SELECT 525 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_0940cae0-3baa-40be-83cd-07caa0fa6a9c4645974070476397401.jpg' AS image_url
    UNION ALL
    SELECT 526 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_75a2f919-6a97-4d7c-a670-3a99dede853b8935415013599341878.jpg' AS image_url
    UNION ALL
    SELECT 527 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_56e04886-3608-4ad6-852b-7324a6e9b9801524913318895505442.jpg' AS image_url
    UNION ALL
    SELECT 528 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_4918b21a-8417-4060-b560-28ca52dbe6563081779727049008758.jpg' AS image_url
    UNION ALL
    SELECT 529 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_2992d3b2-b661-4c86-be64-91b451f994057770143804722194383.jpg' AS image_url
    UNION ALL
    SELECT 530 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_2ba1b3ed-a7cb-4a5f-afda-bc1af7cfc4542785738170209107043.jpg' AS image_url
    UNION ALL
    SELECT 531 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_d7c298cc-f900-4dc4-813d-bdb0492c659c895167825690173225.jpg' AS image_url
    UNION ALL
    SELECT 532 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_a5c4f81d-e281-44d8-9fa4-4d1b32a995c23674083690192911208.jpg' AS image_url
    UNION ALL
    SELECT 534 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_2ba1f427-a422-4cde-a880-f380ed8e77a94762877334066637222.jpg' AS image_url
    UNION ALL
    SELECT 535 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_2b899c3d-27ed-4ed6-a70b-45ec56d3ef648151617057421226018.jpg' AS image_url
    UNION ALL
    SELECT 536 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_4e0907d6-8024-4fe7-8721-e63afd78b8b3469668098835052882.jpg' AS image_url
    UNION ALL
    SELECT 537 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_8b481122-f903-40f0-a76b-21429337a93b8684778342576733127.jpg' AS image_url
    UNION ALL
    SELECT 538 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_1add10ee-1b63-4e37-9425-1cc5580ef3b55315230075136770525.jpg' AS image_url
    UNION ALL
    SELECT 539 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_9f73112e-f670-4154-96d5-a95c8f75007a6116949892914993615.jpg' AS image_url
    UNION ALL
    SELECT 540 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_3252c755-4068-4c19-8f8c-1e67af99ba0d9085962695544051023.jpg' AS image_url
    UNION ALL
    SELECT 541 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_63fd3bbd-86cc-404c-8462-861c41432c446509804788221860138.jpg' AS image_url
    UNION ALL
    SELECT 542 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_153ea3fe-8ff2-4bc6-a257-41b967856fae1143668913029920918.jpg' AS image_url
    UNION ALL
    SELECT 543 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_2efc7987-dff0-437e-8c10-654a06ad63f45765486489414859706.jpg' AS image_url
    UNION ALL
    SELECT 544 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_ff845da7-84ba-49e2-a59d-2d0ecfa15806817508548275549060.jpg' AS image_url
    UNION ALL
    SELECT 545 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_754840d5-b2bb-4161-b06d-9bdb014e132a1768174082527254147.jpg' AS image_url
    UNION ALL
    SELECT 546 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_eb30b6da-62ab-4548-bb54-365cc03f17cc5467282412163280743.jpg' AS image_url
    UNION ALL
    SELECT 547 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_7e322866-771b-432e-bf05-bb661a345b206521853255700484600.jpg' AS image_url
    UNION ALL
    SELECT 548 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_5f551423-180f-4c79-a2a6-76890d9b81ac8611857967310647260.jpg' AS image_url
    UNION ALL
    SELECT 549 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_d1f626f9-2ecf-4338-9f3c-3b04423810e74358408460878132301.jpg' AS image_url
    UNION ALL
    SELECT 550 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_c3fc47af-569a-4ea7-ae56-0eab4a22e33f4073730093765573931.jpg' AS image_url
    UNION ALL
    SELECT 551 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_46218722-142f-41c6-bffe-9acabc8697c190107583990625362.jpg' AS image_url
    UNION ALL
    SELECT 557 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_abadf96d-83d9-4936-8a7f-d98a86594bc33110804242483518950.jpg' AS image_url
    UNION ALL
    SELECT 559 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_9d03cbe7-4985-491f-86b9-e65db1dcd7992473830275750361656.jpg' AS image_url
    UNION ALL
    SELECT 566 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_01c70d81-16b2-4ef7-af37-c540d4e6cbf36934525522215404728.jpg' AS image_url
    UNION ALL
    SELECT 567 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_1a77857f-3161-4e7a-b97b-16c6f097c4cf9161063817545577328.jpg' AS image_url
    UNION ALL
    SELECT 568 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_770167eb-b133-416f-a1a2-b9c479a6ca637624784381429258058.jpg' AS image_url
    UNION ALL
    SELECT 569 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_f43d7d3e-0657-411d-b520-ea6c649b68da5860130562088894026.jpg' AS image_url
    UNION ALL
    SELECT 570 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1859/insta_assets_crop_82b58a36-1446-4613-9f27-1cc5e91df6f53774867523232868217.jpg' AS image_url
    UNION ALL
    SELECT 572 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6734/insta_assets_crop_2fe87c1e-f818-43ee-93f7-afdc8528d16a3772378602787053391.jpg' AS image_url
    UNION ALL
    SELECT 573 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6734/insta_assets_crop_20d0208d-8b85-4865-873f-2c84e3f5d9eb3943440796149813708.jpg' AS image_url
    UNION ALL
    SELECT 575 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/252/insta_assets_crop_f605ef00-5fe1-4185-8968-526949f97e014479088971274060966.jpg' AS image_url
    UNION ALL
    SELECT 576 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/252/insta_assets_crop_413176d5-8c56-41db-ae10-8cd7784992916556219585126345705.jpg' AS image_url
    UNION ALL
    SELECT 577 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/252/insta_assets_crop_1ef200ab-02d9-4ace-86a9-92d248056c7b1933477461040411876.jpg' AS image_url
    UNION ALL
    SELECT 578 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/252/insta_assets_crop_464bc5b3-34fb-4155-8180-1235207e087a4383046824922831287.jpg' AS image_url
    UNION ALL
    SELECT 580 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_aa1e315e-48ff-4d3d-8e4e-6f4792aeefd51252468249629998077.jpg' AS image_url
    UNION ALL
    SELECT 586 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_45e431cd-501b-4198-bf96-b8f1b12fda3f717414517752270796.jpg' AS image_url
    UNION ALL
    SELECT 587 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_231be513-1cb2-456b-94a9-3009307b3b806970081242267272727.jpg' AS image_url
    UNION ALL
    SELECT 589 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_b09e8cb6-7ba6-42e5-ab36-d2c40974dd75539817864070840163.jpg' AS image_url
    UNION ALL
    SELECT 590 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_2989203b-ed36-4e4c-8769-f8bff8261e61870434061912656114.jpg' AS image_url
    UNION ALL
    SELECT 591 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_3d1f8aa6-b00c-4007-8492-edba88690cc91810658821180443834.jpg' AS image_url
    UNION ALL
    SELECT 593 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_4c472e57-5026-43bd-aebc-8def85c6fc861683587482087479727.jpg' AS image_url
    UNION ALL
    SELECT 594 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_67aef3e9-a6c3-41aa-bcbc-de8cc5d25104165946231220683438.jpg' AS image_url
    UNION ALL
    SELECT 595 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7163/insta_assets_crop_dc281ee4-4604-483c-917e-1e05adddd38f2646396705828694474.jpg' AS image_url
    UNION ALL
    SELECT 596 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5386/insta_assets_crop_a49d4363-8187-4463-83f6-1b21e28796124148415268670604316.jpg' AS image_url
    UNION ALL
    SELECT 597 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_fd211dcd-f540-450d-998c-924c2b741e952107160723818858115.jpg' AS image_url
    UNION ALL
    SELECT 598 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_90ad6f23-0b4e-43e5-9234-c52d61c35a884973963828521021411.jpg' AS image_url
    UNION ALL
    SELECT 599 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_f974869d-0fcc-4f6a-9e71-17e6a900db232080923113814704106.jpg' AS image_url
    UNION ALL
    SELECT 600 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_f6a6b466-e42a-49d1-80b8-a943f30b3a1f8228590030393425756.jpg' AS image_url
    UNION ALL
    SELECT 601 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_1fb79e94-f009-4cfe-a851-5701137d0f923539614896381501634.jpg' AS image_url
    UNION ALL
    SELECT 602 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7166/insta_assets_crop_a82e583a-51ac-45b5-b0e6-0933e9e53b8f3667131839611260691.jpg' AS image_url
    UNION ALL
    SELECT 603 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7166/insta_assets_crop_a82e583a-51ac-45b5-b0e6-0933e9e53b8f3667131839611260691.jpg' AS image_url
    UNION ALL
    SELECT 605 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6927/insta_assets_crop_0070eaf3-94b4-4c4e-b9c5-0838762bc9693723928925976052988.jpg' AS image_url
    UNION ALL
    SELECT 610 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_599a14fa-cfd4-4da7-9b47-c13c406ed0d21065384090786100749.jpg' AS image_url
    UNION ALL
    SELECT 611 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6927/insta_assets_crop_728dade9-0467-417a-babe-ef1c40c0465f961121088329870332.jpg' AS image_url
    UNION ALL
    SELECT 612 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6927/insta_assets_crop_88e627bf-e0f9-4090-bc6f-52a2ee9517125291019914080009971.jpg' AS image_url
    UNION ALL
    SELECT 613 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_587c8e8b-225a-422c-8f31-0abab2be03402755253027167484386.jpg' AS image_url
    UNION ALL
    SELECT 614 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_bf734c29-3568-4978-9f48-a68bd7f31ecb8490059665322487890.jpg' AS image_url
    UNION ALL
    SELECT 615 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_3e35232c-9146-4c6c-a951-c1d358b1c7cf7517278316654983345.jpg' AS image_url
    UNION ALL
    SELECT 616 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_1995d196-d9c3-4607-8156-1b9e1031fdae3396993308989779752.jpg' AS image_url
    UNION ALL
    SELECT 618 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6927/insta_assets_crop_df0be2d0-ad72-45d9-af58-1a0cf00200316630631456915110538.jpg' AS image_url
    UNION ALL
    SELECT 619 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_f2b88397-ef58-44d5-bc24-2e094e3402db401833754179422959.jpg' AS image_url
    UNION ALL
    SELECT 620 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_e4665266-f5e0-437d-bcf4-0b4949f03c36715007140143853791.jpg' AS image_url
    UNION ALL
    SELECT 621 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_dd0a2482-efdb-43d8-9db7-cd712945eeb01283250630614483659.jpg' AS image_url
    UNION ALL
    SELECT 622 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_7623332b-8d66-4442-ac83-661c9088a15c4875531713748252022.jpg' AS image_url
    UNION ALL
    SELECT 623 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_16921292-2c15-4d7c-9c27-d0d10bb7165a7604040663364516846.jpg' AS image_url
    UNION ALL
    SELECT 624 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6927/insta_assets_crop_a9b61444-5ec4-4f85-9afa-fd56d129ad5a1920228372373470211.jpg' AS image_url
    UNION ALL
    SELECT 625 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6927/insta_assets_crop_5d0e1f1d-3091-4721-bc2a-88a837953b35193095487408772647.jpg' AS image_url
    UNION ALL
    SELECT 634 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_939c773e-c86e-40f4-a2e9-9826bcc16e574211677531071420127.jpg' AS image_url
    UNION ALL
    SELECT 637 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_40915729-e44c-4318-a649-6daa6f484e827777767647750594971.jpg' AS image_url
    UNION ALL
    SELECT 638 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_ccbfec97-8074-44cc-a1f4-61f0ecd905d97809964543406606392.jpg' AS image_url
    UNION ALL
    SELECT 639 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6927/insta_assets_crop_8ecf03fe-319d-425b-8d43-b759dc2fd5527696202894286725986.jpg' AS image_url
    UNION ALL
    SELECT 640 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_df603212-33a7-4519-b7b7-d7480fd45b6e3155858851242526417.jpg' AS image_url
    UNION ALL
    SELECT 644 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_14ef390f-5e0f-4142-806c-52bbeff4a7a58193055951854481927.jpg' AS image_url
    UNION ALL
    SELECT 645 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7168/insta_assets_crop_4a92eb1e-dcc9-4fbd-8875-21d523ad5ae47677433801941656660.jpg' AS image_url
    UNION ALL
    SELECT 648 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7168/insta_assets_crop_52686a35-4894-44a7-bd86-5f2b0c3e31b72393471599335340348.jpg' AS image_url
    UNION ALL
    SELECT 649 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7168/insta_assets_crop_da5eb798-0cdb-4db8-91f3-4977ad0411bf3704202438148800703.jpg' AS image_url
    UNION ALL
    SELECT 650 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_d3f48f96-972d-4194-8dbb-2a72299cc6a89086775394123537903.jpg' AS image_url
    UNION ALL
    SELECT 652 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_f8f6379b-6965-4a22-9b92-38f0c48d1f483805463405390860950.jpg' AS image_url
    UNION ALL
    SELECT 654 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_7b20c39c-966e-456e-b0b7-8483ef6e790f3861424544271864022.jpg' AS image_url
    UNION ALL
    SELECT 655 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_8baa9dd4-f3ae-457a-b6a7-97b02d3acae87937522586689824422.jpg' AS image_url
    UNION ALL
    SELECT 657 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_2e41f6f7-e0c4-423f-84df-868c1b100c141921370982296573234.jpg' AS image_url
    UNION ALL
    SELECT 658 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_c5e5ad68-0a9c-40f4-a2b9-497f950dbe8a7193295614088128567.jpg' AS image_url
    UNION ALL
    SELECT 659 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_0060a954-3fd3-49ab-a045-5ac951979a5c2749078646020544664.jpg' AS image_url
    UNION ALL
    SELECT 660 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_ccd8dac3-a358-4319-b31d-154a155f509a4616153938293407584.jpg' AS image_url
    UNION ALL
    SELECT 661 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_e8c5c9f6-ca75-4ef1-ac29-fc1714ae2e9f8738644830864014370.jpg' AS image_url
    UNION ALL
    SELECT 662 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_a7ba334b-3ad8-4fc2-8559-65b340cadd6c6049742537666934524.jpg' AS image_url
    UNION ALL
    SELECT 663 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_3bcb2d74-ef15-46e7-b44a-2913e9e7ac426689497533890112582.jpg' AS image_url
    UNION ALL
    SELECT 664 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_2a3f254f-0e2d-4f13-a253-fe5d111030718526294084771849943.jpg' AS image_url
    UNION ALL
    SELECT 665 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_164bd77a-8229-4c67-9beb-a0048ab0d5605922187077584546113.jpg' AS image_url
    UNION ALL
    SELECT 666 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_f812b818-58b8-4591-ac06-5cbe182bd1af873573985897581029.jpg' AS image_url
    UNION ALL
    SELECT 667 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_77c2d50b-cf58-4ad8-841f-525b195398116461861659118101040.jpg' AS image_url
    UNION ALL
    SELECT 668 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_14eb8123-8bfb-427b-a603-b768d0ccd6837364626971260316725.jpg' AS image_url
    UNION ALL
    SELECT 669 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_ca6906a8-d273-45e5-8454-a4d4da22a57e649924432485090125.jpg' AS image_url
    UNION ALL
    SELECT 670 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_81513c47-ef0b-46b6-a381-913d78a98edc1456328193856599604.jpg' AS image_url
    UNION ALL
    SELECT 671 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_8ca293ce-7899-4f5e-bb6e-65d555c64187265855673127446269.jpg' AS image_url
    UNION ALL
    SELECT 672 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5935/insta_assets_crop_a028c0dc-2bca-42e9-a4e5-ed7ddb5983e6966612123652983113.jpg' AS image_url
    UNION ALL
    SELECT 673 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_62da950e-f604-476e-b65a-0ad37dedf0876806353128708897383.jpg' AS image_url
    UNION ALL
    SELECT 674 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_111b82ec-dda7-4938-9ed0-897702c1147c6854106583886534721.jpg' AS image_url
    UNION ALL
    SELECT 675 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_370e84d6-b342-4db6-8a67-3d437137bb4e7781714085364798435.jpg' AS image_url
    UNION ALL
    SELECT 676 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_0721b360-dd23-4f1a-abc5-46b40dacf5fb5015261486533879687.jpg' AS image_url
    UNION ALL
    SELECT 677 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_8e03e057-0296-4897-9881-3cd941c960146594730208665488563.jpg' AS image_url
    UNION ALL
    SELECT 678 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3711/insta_assets_crop_ba9e7034-efe4-44f5-b47f-a428619498404223575021149146707.jpg' AS image_url
    UNION ALL
    SELECT 679 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_3a9db1ba-fd45-4fed-a4e5-87af10d22edc2799143512990464860.jpg' AS image_url
    UNION ALL
    SELECT 680 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_518cb9f6-7469-4a44-b221-ecac6d365daa1031592323293775219.jpg' AS image_url
    UNION ALL
    SELECT 681 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_f8062b02-a658-4f50-a6fa-f92c81523eb48927475843256036450.jpg' AS image_url
    UNION ALL
    SELECT 682 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_3339882a-450a-41cf-9976-77e08ece9164782666588004406402.jpg' AS image_url
    UNION ALL
    SELECT 683 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_90faaf51-8adc-4906-8c4e-af7f3089d9428674845031831412389.jpg' AS image_url
    UNION ALL
    SELECT 684 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_c265777a-762c-4936-9c11-73cfb15f5d013812829456205773635.jpg' AS image_url
    UNION ALL
    SELECT 685 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_15c2552f-3956-4db6-a561-5872b3fdbb4e6834271195660044443.jpg' AS image_url
    UNION ALL
    SELECT 686 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_15f6eb62-09c7-4364-859a-ef4e9ff2f29c3518195327302031861.jpg' AS image_url
    UNION ALL
    SELECT 687 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_ff078cfd-acf9-4b38-b110-b9047d43a9302447889175130361521.jpg' AS image_url
    UNION ALL
    SELECT 688 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_4b3f00d3-2d4a-4414-b1c0-57d6418299457064771969814504362.jpg' AS image_url
    UNION ALL
    SELECT 691 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_d521eee4-e3d3-4f7c-b375-76e9af5fa5ae6977189084306202426.jpg' AS image_url
    UNION ALL
    SELECT 692 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_e5a5bda3-0a68-4e3a-892e-c4aedd160c8d7715872659320877540.jpg' AS image_url
    UNION ALL
    SELECT 693 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_7dbf645a-ddb3-4795-89c1-138df7d801205715873208452408435.jpg' AS image_url
    UNION ALL
    SELECT 694 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1990/insta_assets_crop_4dc5e609-59ec-49ef-9bf6-377422cc971b2243936451676674031.jpg' AS image_url
    UNION ALL
    SELECT 695 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1990/insta_assets_crop_ab56a5e0-6603-4444-82eb-c242546db5597541391221876974292.jpg' AS image_url
    UNION ALL
    SELECT 696 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_b41c2f04-fa21-468e-a0c5-0d37877213402571427892489929889.jpg' AS image_url
    UNION ALL
    SELECT 697 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_600780c9-1a96-4b33-967c-43404d073cdc1056729600001727860.jpg' AS image_url
    UNION ALL
    SELECT 698 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_5bbcb650-6f1b-41a1-aeb6-451c9bbefe731369782379825462203.jpg' AS image_url
    UNION ALL
    SELECT 699 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_9149add7-61a5-47ad-b3fe-ee6fe6d340793128345886094472683.jpg' AS image_url
    UNION ALL
    SELECT 707 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_900da415-375c-4fa0-9f92-3649feb80bdf6026600052479351117.jpg' AS image_url
    UNION ALL
    SELECT 709 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_6d67035d-ac9a-481d-8e07-78d013d5bdee1028335682393373998.jpg' AS image_url
    UNION ALL
    SELECT 711 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_1ee8ab51-8d7c-4d46-bf76-93a98dde44ed6111130180938803163.jpg' AS image_url
    UNION ALL
    SELECT 712 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_170d8753-c3e8-4c4e-b748-353ade6d96dc1561434834560994517.jpg' AS image_url
    UNION ALL
    SELECT 713 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_7cbe78fb-c7b3-4f15-a301-cd8af2b0ea347449168724631833618.jpg' AS image_url
    UNION ALL
    SELECT 715 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4172/insta_assets_crop_8b0b7b1f-99c4-4d83-b612-64bf20f85a387514546011622040450.jpg' AS image_url
    UNION ALL
    SELECT 724 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4380/insta_assets_crop_077822a6-d46b-4d8b-aba1-09d885ff7d638940182018845443969.jpg' AS image_url
    UNION ALL
    SELECT 725 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4380/insta_assets_crop_de0cfb69-632a-4b82-87c3-076141a811564062857438305420551.jpg' AS image_url
    UNION ALL
    SELECT 726 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7105/insta_assets_crop_e1c91023-b5fb-4746-afc8-f2f437b58fb45831479635759998018.jpg' AS image_url
    UNION ALL
    SELECT 735 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/273/insta_assets_crop_48c6828a-d5db-4ceb-b3ed-3d9fb60c5da27229259129283472332.jpg' AS image_url
    UNION ALL
    SELECT 736 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/273/insta_assets_crop_3fb3e12a-0b71-4804-822a-2574f4f4ab058322272317174898148.jpg' AS image_url
    UNION ALL
    SELECT 737 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/273/insta_assets_crop_38b5f639-a475-47b0-81cb-7cb69c87eaf97894978876838540530.jpg' AS image_url
    UNION ALL
    SELECT 738 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7170/insta_assets_crop_3029c1f6-ae97-4600-8466-36e1aeb55db03815603805905198801.jpg' AS image_url
    UNION ALL
    SELECT 739 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7170/insta_assets_crop_7153067f-4318-4c7a-8a36-d0ccf2538cf05734135424647695960.jpg' AS image_url
    UNION ALL
    SELECT 740 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7170/insta_assets_crop_13c1b316-39be-44e0-808f-4cf6d05b51ca7581542363592449096.jpg' AS image_url
    UNION ALL
    SELECT 741 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7170/insta_assets_crop_3dee017b-42a3-428a-be06-bd85cac641a45709588933651368769.jpg' AS image_url
    UNION ALL
    SELECT 742 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7170/insta_assets_crop_0afa96dc-d7a0-4933-bace-1e0a23f8438b5445885858030661606.jpg' AS image_url
    UNION ALL
    SELECT 743 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_5f4be123-41e9-4a6a-8262-5eb9b0c987193571406512085262280.jpg' AS image_url
    UNION ALL
    SELECT 744 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_fa979d54-d2b4-4300-9f79-ebc0beb039e03074866992235544524.jpg' AS image_url
    UNION ALL
    SELECT 745 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_4fb1040f-2bd0-4618-ba5d-cd7dbc2209ab2260862615386788241.jpg' AS image_url
    UNION ALL
    SELECT 746 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_8ced0114-a0ff-4da0-9633-cb7e9e6bee844967594721327227732.jpg' AS image_url
    UNION ALL
    SELECT 747 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_ce1a08cb-9495-4bf5-9208-e4374648c9cd7386344154223428964.jpg' AS image_url
    UNION ALL
    SELECT 748 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_18d9df41-5ef0-405e-a228-beb91389ba485868062274151840848.jpg' AS image_url
    UNION ALL
    SELECT 749 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_49676ea1-199b-40ca-886e-d093443180f35884735460821109763.jpg' AS image_url
    UNION ALL
    SELECT 750 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_29848746-3897-4916-b5f8-7a65881add387354283858788676696.jpg' AS image_url
    UNION ALL
    SELECT 751 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_c08f5ebe-4d4c-4932-a3ff-acb0d0f4cc6e5123870643744791198.jpg' AS image_url
    UNION ALL
    SELECT 752 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_e45157bc-ad1b-42ac-9fdf-2760c2ecb2d92957246884379987970.jpg' AS image_url
    UNION ALL
    SELECT 753 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_36c23fe1-18d3-48b1-875e-b138335759277057825997188997663.jpg' AS image_url
    UNION ALL
    SELECT 754 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_8b064b12-24ae-4392-b511-5bf5d042ff465469468861931287447.jpg' AS image_url
    UNION ALL
    SELECT 755 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_011ae925-5b24-4d9a-bbd9-6daf662de4442220187110711712052.jpg' AS image_url
    UNION ALL
    SELECT 756 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_33b997d0-7780-4bb5-89ba-d41cedfbddae8013353020371898650.jpg' AS image_url
    UNION ALL
    SELECT 757 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_f00d0989-cf1b-47e0-b91c-3bf8ed61060d2617111586719562223.jpg' AS image_url
    UNION ALL
    SELECT 758 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_fb0d76c3-4201-4998-8f2f-e54691b97fa28574598510389255756.jpg' AS image_url
    UNION ALL
    SELECT 759 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_415f1c0d-499c-484e-a4de-2778a5e33f5f5544722956425443649.jpg' AS image_url
    UNION ALL
    SELECT 760 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_6c5a302c-5841-4cc6-a9c4-817f821960b41493543163214007817.jpg' AS image_url
    UNION ALL
    SELECT 761 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_b0e43f77-1537-49c1-ab1a-46fc4594d7556816561881783654454.jpg' AS image_url
    UNION ALL
    SELECT 762 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_409eebfc-5f32-4900-a8da-8e61a4ca81276290118126191214202.jpg' AS image_url
    UNION ALL
    SELECT 763 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_b75fe1d5-9eaf-4964-b2b9-8169e8076a118148776770754543730.jpg' AS image_url
    UNION ALL
    SELECT 764 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_3bab6f14-9c78-4e2c-b241-56966438a3d0475586169170260337.jpg' AS image_url
    UNION ALL
    SELECT 765 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_d4ecd3ca-ee24-43f6-a16d-96e54fbb52e12245370500829093399.jpg' AS image_url
    UNION ALL
    SELECT 766 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_95565309-8527-4cb7-ad59-447c590af7542476193053931707040.jpg' AS image_url
    UNION ALL
    SELECT 767 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_2cd4f971-6110-4fbd-963d-148140eb564d3308288400119623771.jpg' AS image_url
    UNION ALL
    SELECT 768 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_4a2843d6-e0e0-4eeb-bf26-40348c1cbb9a805872273706670962.jpg' AS image_url
    UNION ALL
    SELECT 769 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_50f0469f-6cde-4602-a399-00236fac96ca1818765076227924136.jpg' AS image_url
    UNION ALL
    SELECT 770 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_b63a244c-fe23-43cd-92db-8ec7bd64727e7091697349945212642.jpg' AS image_url
    UNION ALL
    SELECT 771 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_6958e6a2-0698-4e1a-8185-4f9692ba27b77681101373407360308.jpg' AS image_url
    UNION ALL
    SELECT 772 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_8b037da0-27ea-486e-b170-b276b8bd785b8645336092122855789.jpg' AS image_url
    UNION ALL
    SELECT 773 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_a1045ee1-e517-4110-a0c5-cfd374fd51694425953375072309054.jpg' AS image_url
    UNION ALL
    SELECT 774 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_b0663ccd-cfb4-4a0b-8187-8a148f9514ee160957027189356682.jpg' AS image_url
    UNION ALL
    SELECT 777 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_23d2608e-d2b4-46cc-9bd4-e6ad196785d83970027492286999004.jpg' AS image_url
    UNION ALL
    SELECT 778 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_7f501805-aa28-4809-84f5-3899b35c199d5213312441172371244.jpg' AS image_url
    UNION ALL
    SELECT 779 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_30c4c172-456f-4280-8609-bd6f1479ef358626152424524896561.jpg' AS image_url
    UNION ALL
    SELECT 780 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_64d19550-5e44-4b5b-ab12-5fa834c0a048309397654216826344.jpg' AS image_url
    UNION ALL
    SELECT 781 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_f6a78e0d-01a1-4962-979e-3047a7ad4ebc7083078107129350146.jpg' AS image_url
    UNION ALL
    SELECT 782 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_7df75002-8db4-4547-8af4-cf00fc98e8773828665340397696383.jpg' AS image_url
    UNION ALL
    SELECT 783 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_051b8220-9d77-430a-a5cb-b4f6af7e62be3810206710897794249.jpg' AS image_url
    UNION ALL
    SELECT 784 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_e9189447-2e06-4266-9406-6fff6a49d12e4388913661317734285.jpg' AS image_url
    UNION ALL
    SELECT 785 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_64a0524f-c318-4c58-bd70-8f1c27707ad77328481393770343964.jpg' AS image_url
    UNION ALL
    SELECT 786 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_e80fd05e-ea15-4026-89dc-dcfd6edd81d4846686418621824699.jpg' AS image_url
    UNION ALL
    SELECT 787 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_9fe25d62-b33b-43ae-905c-b4e39df7ca7a30009566263615944.jpg' AS image_url
    UNION ALL
    SELECT 788 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_b15e6938-508d-4f54-84a3-fab5d7cae67b4058671189165816954.jpg' AS image_url
    UNION ALL
    SELECT 789 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_86ffe897-b52e-4b5d-b984-51ccb08193a38269449585428253446.jpg' AS image_url
    UNION ALL
    SELECT 790 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_f8fa4bcd-a1f9-4c92-a241-798fad4a8b3b8285169141062850109.jpg' AS image_url
    UNION ALL
    SELECT 791 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_3f961720-7c0b-40f3-bac9-f2ceded2005c3979558131215722275.jpg' AS image_url
    UNION ALL
    SELECT 793 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_e38622b2-4fe0-445f-8e6c-1d3d42bd02215837788196795205824.jpg' AS image_url
    UNION ALL
    SELECT 794 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_36cf08bb-1dd5-4276-bb1d-8373ec4efec63490939006565547743.jpg' AS image_url
    UNION ALL
    SELECT 795 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_3a563e19-d5c8-4938-9edc-eaf87264fff73434201878428396135.jpg' AS image_url
    UNION ALL
    SELECT 796 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_4e92a2f2-491e-44e9-af45-e07fbdd39fda7261734141092604797.jpg' AS image_url
    UNION ALL
    SELECT 797 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_7389cbac-0778-450a-b96b-8acec51c00652066461048698957374.jpg' AS image_url
    UNION ALL
    SELECT 798 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7173/insta_assets_crop_5fcb0423-bc99-46bc-a6d5-ebee8f36ea454933664215370238711.jpg' AS image_url
    UNION ALL
    SELECT 799 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7173/insta_assets_crop_a51037ea-5730-4ec6-b030-4b8a49c93cd06087338628613085282.jpg' AS image_url
    UNION ALL
    SELECT 801 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7173/insta_assets_crop_365855a4-faab-4818-a7e5-409ebf8f5bb61201814960001900092.jpg' AS image_url
    UNION ALL
    SELECT 802 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7174/insta_assets_crop_3f300157-7e4a-41b7-a6dd-76623b5f816e8598603886483322908.jpg' AS image_url
    UNION ALL
    SELECT 803 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7173/insta_assets_crop_48b075f6-7000-477b-8423-9e53aac4411b8331454460306076381.jpg' AS image_url
    UNION ALL
    SELECT 804 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_f793e9ad-45e8-4c92-95e0-3c907d25862d2731091070210065588.jpg' AS image_url
    UNION ALL
    SELECT 805 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_59c66df7-1ea6-404e-b762-e7ab146fef076708601455411995888.jpg' AS image_url
    UNION ALL
    SELECT 806 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_1e053a68-59a3-497d-a8bf-fb06cae1b3b96708254589735672088.jpg' AS image_url
    UNION ALL
    SELECT 807 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_0170b8f2-42ed-472e-bf70-2ed683e396b87049645890395422463.jpg' AS image_url
    UNION ALL
    SELECT 808 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_0d5b7f09-89e6-4efb-aa78-32e83cc36aa5910652269166509322.jpg' AS image_url
    UNION ALL
    SELECT 809 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_00bdd326-fe91-44ef-8704-cbdef0e7395e8466366916355905738.jpg' AS image_url
    UNION ALL
    SELECT 810 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_619ef8f5-8ba1-4742-bc8c-4cbe38a3384c5119149148684125732.jpg' AS image_url
    UNION ALL
    SELECT 811 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_06e957e3-c570-44f8-950c-e1bcc08fd1fe5592908719442544503.jpg' AS image_url
    UNION ALL
    SELECT 812 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_c5b9369f-bdcc-44d9-8782-021aadc7f9e75994831466693376553.jpg' AS image_url
    UNION ALL
    SELECT 813 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1099/insta_assets_crop_dd674191-c846-4eb9-a869-9e145fbe8dae3941761893515267295.jpg' AS image_url
    UNION ALL
    SELECT 814 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_adbc70a6-a7b8-464d-af85-f2dcbec7e6597334424996082388013.jpg' AS image_url
    UNION ALL
    SELECT 815 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_9a7f7aea-ae8d-4d13-b39c-7ac48cf3c1199114515355073294590.jpg' AS image_url
    UNION ALL
    SELECT 816 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_43e1150d-e9d0-4a73-8570-56d913a93ea78944635499754029288.jpg' AS image_url
    UNION ALL
    SELECT 817 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_3655e047-2dbf-4b7f-83a6-f96460fae6385902692243838983549.jpg' AS image_url
    UNION ALL
    SELECT 818 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_be5461d2-66a3-462c-ab47-9dcd82f173152096250063462757963.jpg' AS image_url
    UNION ALL
    SELECT 819 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_bba18ba3-705f-41b7-95c0-5cb332d0e30a5221505037771518924.jpg' AS image_url
    UNION ALL
    SELECT 820 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5970/insta_assets_crop_89f810b2-23af-462d-bf48-4ca305ed84b67645118846052540891.jpg' AS image_url
    UNION ALL
    SELECT 821 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5970/insta_assets_crop_df724f8a-cde1-46f7-abf0-f388225e88087113990284677092024.jpg' AS image_url
    UNION ALL
    SELECT 822 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5970/insta_assets_crop_1599f919-2426-4f66-8e72-f1c56e7d77681043386262327748135.jpg' AS image_url
    UNION ALL
    SELECT 823 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5970/insta_assets_crop_2d04172d-58de-4e2a-a66a-5555f3601dcf6233763939306815946.jpg' AS image_url
    UNION ALL
    SELECT 824 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5970/insta_assets_crop_5bd11462-4c04-4a0b-890f-32c3188870aa7413978358090527305.jpg' AS image_url
    UNION ALL
    SELECT 825 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2101/insta_assets_crop_d6ef7079-660e-46d2-8963-7f41ae37f31e1942934714847434561.jpg' AS image_url
    UNION ALL
    SELECT 826 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1570/image_cropper_C6911400-B3A5-4F55-AC46-997FDD441444-7752-000004EB5AEB67C8.jpg' AS image_url
    UNION ALL
    SELECT 827 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1570/image_cropper_FB10B37E-9C28-4196-A3AB-17DAD1B8BB66-7752-000004EBD3C42E0A.jpg' AS image_url
    UNION ALL
    SELECT 829 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1570/image_cropper_11D3929A-CECD-4845-8244-24CFB60FA22B-7752-000004EC0B5AC14E.jpg' AS image_url
    UNION ALL
    SELECT 832 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1570/image_cropper_C2BCD4DE-1403-4EB7-83D9-2A04801CE491-7752-000004EC6810AAC2.jpg' AS image_url
    UNION ALL
    SELECT 833 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6876/insta_assets_crop_708f3131-8294-44ad-b079-cdc4a57f28ae6806918804191842322.jpg' AS image_url
    UNION ALL
    SELECT 834 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6876/insta_assets_crop_897ffb6d-c8f7-4e1c-8ac6-25d0f93a24657100012247538208436.jpg' AS image_url
    UNION ALL
    SELECT 835 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6876/insta_assets_crop_becf74e3-b9c3-445f-ae23-ab41c25f7a5d1242793917244392067.jpg' AS image_url
    UNION ALL
    SELECT 836 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6876/insta_assets_crop_419f6c43-983f-4eef-8064-1852bc442f5b9054493900124286436.jpg' AS image_url
    UNION ALL
    SELECT 837 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6876/insta_assets_crop_84ede28b-85a5-4955-a5ed-23552912ca6c6972551057025272677.jpg' AS image_url
    UNION ALL
    SELECT 838 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7180/insta_assets_crop_0854df22-b28a-4600-a258-0e3942059dca7441983161269038255.jpg' AS image_url
    UNION ALL
    SELECT 839 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7181/insta_assets_crop_e06c2ce9-2136-4f31-b458-5ff8bef09024575281872250217820.jpg' AS image_url
    UNION ALL
    SELECT 840 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7181/insta_assets_crop_168bd499-2588-494c-8df4-ad0f09229c301880778896772846637.jpg' AS image_url
    UNION ALL
    SELECT 841 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7068/insta_assets_crop_706c13a4-25c3-4432-81d4-592a59353b6e2276188350408005378.jpg' AS image_url
    UNION ALL
    SELECT 842 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7183/insta_assets_crop_274dfb83-76dd-4367-8bde-8d6c5df4dce87282983696587131948.jpg' AS image_url
    UNION ALL
    SELECT 852 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7184/insta_assets_crop_89a79d0f-8f53-482a-92cb-a59f0db4b4986688727343046328860.jpg' AS image_url
    UNION ALL
    SELECT 853 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6767/insta_assets_crop_ccfb0fed-88c6-45c9-b3b6-45968b3efc803614866220013060698.jpg' AS image_url
    UNION ALL
    SELECT 854 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6767/insta_assets_crop_b97eb09c-ba06-489c-b993-3e970f639be95296393356336569888.jpg' AS image_url
    UNION ALL
    SELECT 856 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6767/insta_assets_crop_4a1aa4f1-5939-49ba-b9fe-59d52d142000571163322299329445.jpg' AS image_url
    UNION ALL
    SELECT 857 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6767/insta_assets_crop_ec7c91a4-403d-474e-af8f-ca20095e43a72498239981532757241.jpg' AS image_url
    UNION ALL
    SELECT 893 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6775/image_cropper_8FAC316F-3D54-474F-9976-666D47C5FA50-7099-000009F9E19DBB94.jpg' AS image_url
    UNION ALL
    SELECT 895 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6775/image_cropper_ED08BB82-CC50-48D9-9734-37D8D42AEF5E-7099-000009FA14C19FF1.jpg' AS image_url
    UNION ALL
    SELECT 896 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6775/image_cropper_AB24F22B-527E-4EC8-A471-1B072158E2DD-7099-000009FA506A26BF.jpg' AS image_url
    UNION ALL
    SELECT 897 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6775/image_cropper_AB869759-452D-4911-A351-478DF9A0EB81-7099-000009FA9664DADB.jpg' AS image_url
    UNION ALL
    SELECT 898 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6775/image_cropper_36C46D30-E8C0-4DEF-8D27-9B71F3663E10-7099-000009FAB5722A59.jpg' AS image_url
    UNION ALL
    SELECT 899 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6775/image_cropper_F367BBE4-12F5-47EC-964E-EF2E2BC47A0F-7099-000009FAD4FFA26A.jpg' AS image_url
    UNION ALL
    SELECT 900 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6775/image_cropper_859D35A4-9A90-42DB-9E2B-395277114C91-7099-000009FAFC4B80E9.jpg' AS image_url
    UNION ALL
    SELECT 901 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6775/image_cropper_942B9A1E-87ED-4E1F-95D7-162DF5CD8CD9-7099-000009FB20ECDE25.jpg' AS image_url
) v ON t.id = v.id
SET t.image_url = v.image_url,
    t.updated_at = NOW();

UPDATE project_media_galleries t
JOIN (
    SELECT 908 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6775/image_cropper_43D30E20-89C4-4048-A525-278601B490B0-11893-00000A1C1DD4471A.jpg' AS image_url
    UNION ALL
    SELECT 912 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6775/image_cropper_7CE17B6B-568A-40FB-AB35-5CAC453569A7-11893-00000A1CD1DBB510.jpg' AS image_url
    UNION ALL
    SELECT 916 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6775/image_cropper_DBF1D930-A4BA-4723-9ADF-63253A0A9A5F-11893-00000A1D5EE8E90B.jpg' AS image_url
    UNION ALL
    SELECT 928 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_2d1a7963-86ec-4745-ba82-35d0ea5d6eb98805737338848895916.jpg' AS image_url
    UNION ALL
    SELECT 929 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_9e84d199-9abc-4c68-abaf-0785321445706957352422636692529.jpg' AS image_url
    UNION ALL
    SELECT 930 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_0337147f-6cd2-472a-9207-f3d7ccf17c7a3434410185861995777.jpg' AS image_url
    UNION ALL
    SELECT 931 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_e9ee6373-59fe-450d-afdd-f9123ff7d3625017099068278281792.jpg' AS image_url
    UNION ALL
    SELECT 932 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_6771bb66-1169-43ef-be05-bc5f2e82367c3382109504928757016.jpg' AS image_url
    UNION ALL
    SELECT 938 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_811be1cb-1252-4ee4-b5c2-2225b225c3151098314401213128164.jpg' AS image_url
    UNION ALL
    SELECT 939 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_a0cc2bb3-51dc-4459-81f4-becdb8f287ff3951695270661574474.jpg' AS image_url
    UNION ALL
    SELECT 940 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_6776112c-5129-4590-a11b-6507cc78648e1586461709716635592.jpg' AS image_url
    UNION ALL
    SELECT 941 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_91753242-3b48-4275-9642-3c1c2f3dc2c96385946034790680322.jpg' AS image_url
    UNION ALL
    SELECT 942 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_645a29c7-9954-45d6-a230-c22e454d332f4435544020845193221.jpg' AS image_url
    UNION ALL
    SELECT 943 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_66c5143c-0b07-4288-b726-13ed721a27757308495386385006818.jpg' AS image_url
    UNION ALL
    SELECT 944 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_68dd9aa0-01e0-4c38-8bc1-a42fdbb149d33507657704699097329.jpg' AS image_url
    UNION ALL
    SELECT 946 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_a61e2cee-6da8-457f-9b5a-3d5136fb31d94036319161015498532.jpg' AS image_url
    UNION ALL
    SELECT 947 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_a1eb90ff-d39f-4bea-90fb-ab55373b426025152167857910134.jpg' AS image_url
    UNION ALL
    SELECT 949 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_a2509bf3-a318-431e-892e-5cefc412e7ee7980977311180745552.jpg' AS image_url
    UNION ALL
    SELECT 954 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_5f34b8ad-8d12-42f3-a7de-f7e026009d787001488746538054929.jpg' AS image_url
    UNION ALL
    SELECT 956 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_b2c5b8e9-a82b-4169-8a3c-f10b396139f57318738697343564796.jpg' AS image_url
    UNION ALL
    SELECT 958 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2985/insta_assets_crop_baa34d6c-fc6b-44f9-82c9-c2c17be26a9f1693405984825079792.jpg' AS image_url
    UNION ALL
    SELECT 959 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2985/insta_assets_crop_80533851-b4c1-4446-bcef-2cd7692b77273781160003598212490.jpg' AS image_url
    UNION ALL
    SELECT 960 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_da1a7906-1375-4805-8bb9-f4f8e64866814277591724495274948.jpg' AS image_url
    UNION ALL
    SELECT 961 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_6c4a25ae-9466-4f7f-9917-bab2aedec04a5376141741835157304.jpg' AS image_url
    UNION ALL
    SELECT 962 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_001f16a4-13f4-4c3a-a331-307f111abf837217306103325031142.jpg' AS image_url
    UNION ALL
    SELECT 963 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_51bd42e1-1369-4535-8d7b-7d158b84ee887430880363346885862.jpg' AS image_url
    UNION ALL
    SELECT 965 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_539b1ce1-b019-4d85-a666-944529109619754539729410240287.jpg' AS image_url
    UNION ALL
    SELECT 966 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_6f1dd4c5-5b94-4f1b-805c-fd0816ed62676273601733438139037.jpg' AS image_url
    UNION ALL
    SELECT 967 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_c64c8998-e6b9-4adf-898a-987b24d3afae451970178622662462.jpg' AS image_url
    UNION ALL
    SELECT 968 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_4474cc6e-3416-4ff9-971d-6f1e15ea44543980937587838458614.jpg' AS image_url
    UNION ALL
    SELECT 969 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2401/insta_assets_crop_704726d2-e25e-4420-be84-0c8c84da556d3313003605883186572.jpg' AS image_url
    UNION ALL
    SELECT 975 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_33a01317-0f06-4734-b2f3-9f716a7df99c7075108166952070169.jpg' AS image_url
    UNION ALL
    SELECT 976 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_8ea9d311-74d2-48e4-bd42-5b784a118b385236794975107868985.jpg' AS image_url
    UNION ALL
    SELECT 977 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_46e09ee6-1160-43f8-872c-a022d52d923b8803438109588377925.jpg' AS image_url
    UNION ALL
    SELECT 997 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7213/scaled_7b1dd64d-f41f-4b7a-b8a9-2e88fb8b87d62614284315500883238.jpg' AS image_url
    UNION ALL
    SELECT 1001 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/8/image_cropper_BA9DE1C9-6458-4147-B010-56DB48A06183-1140-00000078D246BAE3.jpg' AS image_url
    UNION ALL
    SELECT 1002 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_6cf951a1-3f1d-4f87-810d-0fa7060eae2e1238926537239500784.jpg' AS image_url
    UNION ALL
    SELECT 1003 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_307515a5-e318-47f8-8ffd-54ffea88beda3781230297329387054.jpg' AS image_url
    UNION ALL
    SELECT 1004 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_961c381a-72f1-49b7-a1ef-58da3fdf7f374675285023666731968.jpg' AS image_url
    UNION ALL
    SELECT 1005 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_2a6d2971-9b6b-4968-9416-c67fdf8f659b4549658866609517826.jpg' AS image_url
    UNION ALL
    SELECT 1007 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_037baf9e-40cb-4e4a-aed2-b591907c55392087738774131249437.jpg' AS image_url
    UNION ALL
    SELECT 1008 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_c1bbdb72-8c6d-4741-9d54-ebbcca80a0fe2468563838378825677.jpg' AS image_url
    UNION ALL
    SELECT 1010 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6688/insta_assets_crop_822dbfd6-259a-4b0d-bb53-0a05ae877bee8779498650781137345.jpg' AS image_url
    UNION ALL
    SELECT 1011 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6688/insta_assets_crop_64c2595d-efa4-4d5f-9baa-b9d5750aecb68570597768838322325.jpg' AS image_url
    UNION ALL
    SELECT 1012 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_d4c27051-efc6-4299-9892-88b905b792644912795761498985915.jpg' AS image_url
    UNION ALL
    SELECT 1014 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_ea621d1f-e9fd-4cbf-85e4-34b9fb6414403546114106911215292.jpg' AS image_url
    UNION ALL
    SELECT 1015 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6688/insta_assets_crop_cd7943c0-da0c-41f7-bfc2-a3677a92a6311294014893973810823.jpg' AS image_url
    UNION ALL
    SELECT 1016 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_68682c29-6c6a-463d-b037-c035f90b69503244368660303744002.jpg' AS image_url
    UNION ALL
    SELECT 1017 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_9a818b6e-1d6e-4dff-a1a6-27380f86cb678373686153211957625.jpg' AS image_url
    UNION ALL
    SELECT 1018 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_5e4bda58-4715-42ea-bc7c-597a4598b9f19068838945154159209.jpg' AS image_url
    UNION ALL
    SELECT 1019 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_60320e6f-f943-4b95-9a90-b5c8c058d3865403638102444837335.jpg' AS image_url
    UNION ALL
    SELECT 1020 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_a62674dc-63e8-4b31-a6fc-81026a0186841163890316073489203.jpg' AS image_url
    UNION ALL
    SELECT 1021 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_7845e10a-a043-4c5d-87ee-8a441e7bed99373351148438670091.jpg' AS image_url
    UNION ALL
    SELECT 1023 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3713/insta_assets_crop_6a238cd2-18cf-4094-b394-ba0991f52c7688493548868365554.jpg' AS image_url
    UNION ALL
    SELECT 1024 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7215/insta_assets_crop_bbf1dfaf-b030-47a1-975f-179ac5712e9c4200594543187882885.jpg' AS image_url
    UNION ALL
    SELECT 1027 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7215/insta_assets_crop_d2bf87cd-5a7d-4859-8f44-ea6be5cc1ef62312244065095104509.jpg' AS image_url
    UNION ALL
    SELECT 1029 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_3571e35e-137c-4fe3-afd2-cc490b06caa31937625493432567548.jpg' AS image_url
    UNION ALL
    SELECT 1032 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_3079b2e8-d73f-461f-ab69-43b6863e107e183873001326044224.jpg' AS image_url
    UNION ALL
    SELECT 1035 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_6e542dee-e1ce-4017-9c8a-b7d478e2258d8146808451447822133.jpg' AS image_url
    UNION ALL
    SELECT 1036 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_b1550ee5-1353-46fa-a4f7-c39bf6a61caa3007590351784027243.jpg' AS image_url
    UNION ALL
    SELECT 1038 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_0e58dd9e-b3fc-43cd-abb6-650d6ee97e001804467283168267766.jpg' AS image_url
    UNION ALL
    SELECT 1039 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_0f3a885e-84c0-4aeb-af1c-e78bb7f601c68487232681914521478.jpg' AS image_url
    UNION ALL
    SELECT 1040 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_81ee9aef-afdc-4740-b4a8-0a30c8d2aaed2770427059824988456.jpg' AS image_url
    UNION ALL
    SELECT 1041 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_53b930db-b862-417c-a144-acc3f34270266086626667456360177.jpg' AS image_url
    UNION ALL
    SELECT 1042 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_a82b78b3-7c56-4a31-a8b2-895d0dc0d4604893631278582891012.jpg' AS image_url
    UNION ALL
    SELECT 1043 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_a9db4e7e-c6f3-43f1-b248-41b93203631a4095491903564409637.jpg' AS image_url
    UNION ALL
    SELECT 1044 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_d74dfe71-921e-4ec9-8ac4-554ae30e08a86606475995727213130.jpg' AS image_url
    UNION ALL
    SELECT 1045 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_793f6adf-195b-4bf9-9588-f1182473dc4c4515536122498578985.jpg' AS image_url
    UNION ALL
    SELECT 1046 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_2949ce81-efff-497c-aed4-a9f5e896d7662974104159388528993.jpg' AS image_url
    UNION ALL
    SELECT 1047 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_00b816cc-a94a-46b4-a5e4-88e26d556c557083600114324108771.jpg' AS image_url
    UNION ALL
    SELECT 1048 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_e8ff963d-b886-4396-bd46-a7e4045894e45527683551691991936.jpg' AS image_url
    UNION ALL
    SELECT 1050 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_00c8eedb-3f18-451d-ab2e-28614cbab1ef2056871838667133581.jpg' AS image_url
    UNION ALL
    SELECT 1052 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_55afe89c-8743-40f4-9460-aa2a69130cbf2628685309343613002.jpg' AS image_url
    UNION ALL
    SELECT 1053 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_5a696bcb-00e2-4f77-97b1-b1bc1049f8d31917796159086452269.jpg' AS image_url
    UNION ALL
    SELECT 1055 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_dd1c1ec5-9567-4d6c-af72-172f61ac8fcd5409641543265552433.jpg' AS image_url
    UNION ALL
    SELECT 1056 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_8b14a2f8-d034-4412-ae58-7a88afb5cfce5744905449091201244.jpg' AS image_url
    UNION ALL
    SELECT 1057 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_a930810f-c36d-4f88-8da5-47627a26345e3926942698871286922.jpg' AS image_url
    UNION ALL
    SELECT 1058 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_742e3bfc-eb90-41eb-a685-9e80f4fcda1c3752968258083438636.jpg' AS image_url
    UNION ALL
    SELECT 1059 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_b2e452ab-2700-4301-96eb-e50779608ce96410675858120242974.jpg' AS image_url
    UNION ALL
    SELECT 1060 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_70baf86d-24dd-45bd-92eb-abc6318e0877702527968802158722.jpg' AS image_url
    UNION ALL
    SELECT 1062 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_7f3fd961-30ed-42c5-ab91-e0a7d11a5ffd4829824778201073636.jpg' AS image_url
    UNION ALL
    SELECT 1063 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_feaa3dc3-75b9-4f13-a1ca-7345b0a88aa37228681734723993828.jpg' AS image_url
    UNION ALL
    SELECT 1064 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_152c83fd-ee3f-490f-a1da-4806bc779e093566421429823070606.jpg' AS image_url
    UNION ALL
    SELECT 1065 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_770ef4fa-d405-4951-880b-0b30e37ee1168908946675474340813.jpg' AS image_url
    UNION ALL
    SELECT 1067 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_99929710-f20e-4306-8f29-f9be64678b8e73498756214750767.jpg' AS image_url
    UNION ALL
    SELECT 1068 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_47c1fc78-46e3-43d8-98fc-b079f786c80c298562745593633837.jpg' AS image_url
    UNION ALL
    SELECT 1070 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_6811bc8f-67bd-4a45-8951-85720d1b858a5286465500220288698.jpg' AS image_url
    UNION ALL
    SELECT 1071 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_1b948612-9212-497f-a656-4611b8d2bbcd8430052755859135887.jpg' AS image_url
    UNION ALL
    SELECT 1074 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_b8142330-dd5f-4271-9efa-e9a6b3bceb201449532887264948538.jpg' AS image_url
    UNION ALL
    SELECT 1081 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_2ee8f438-ad29-4ffd-a5f9-94407166b8347933568523151059010.jpg' AS image_url
    UNION ALL
    SELECT 1083 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_989b2e8b-d758-4d1a-b731-d3024b1ed6682141636670967429739.jpg' AS image_url
    UNION ALL
    SELECT 1084 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_ef4b26b5-55a1-4b6f-b9c2-28627402976b6579405770233279178.jpg' AS image_url
    UNION ALL
    SELECT 1085 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_9a16ac79-d469-45a4-a9ae-51fcc8046aac2234209632514603874.jpg' AS image_url
    UNION ALL
    SELECT 1087 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_425e63e6-31a2-4fc9-9e85-54473d6cf31737480298590152712.jpg' AS image_url
    UNION ALL
    SELECT 1091 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_877769b2-ffe7-4e34-b742-644c1475f65d6674527249544654205.jpg' AS image_url
    UNION ALL
    SELECT 1092 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_12b05094-839e-4ff2-8edd-511ba01e98015958739164201440619.jpg' AS image_url
    UNION ALL
    SELECT 1093 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_b23358b3-773f-4fca-acc5-267e65250b6a8717401556363599706.jpg' AS image_url
    UNION ALL
    SELECT 1094 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_21dbe6c3-471f-4770-aaae-089d703d4dd35256027944430348323.jpg' AS image_url
    UNION ALL
    SELECT 1095 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_3417cf00-9d73-4b37-a375-21b0060f28795293698828720571652.jpg' AS image_url
    UNION ALL
    SELECT 1097 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_92bb9d1c-163d-486a-9564-163af1a37ab68891545549769529662.jpg' AS image_url
    UNION ALL
    SELECT 1098 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_a5e03718-5806-4c0e-9c5a-566e2ad6aad92939717172430522953.jpg' AS image_url
    UNION ALL
    SELECT 1099 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_8676ab3d-f244-4970-bece-d30649703b7d7743156077969863192.jpg' AS image_url
    UNION ALL
    SELECT 1100 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_5b4136ae-5762-4c51-ad71-7d0949a982a51724956826435231172.jpg' AS image_url
    UNION ALL
    SELECT 1103 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_86ee2878-c44a-4b42-b961-d45c6265c9ee7021707407131319236.jpg' AS image_url
    UNION ALL
    SELECT 1104 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_ec9fd58c-977b-4c3d-b32d-bff0f03567df4589746413663120393.jpg' AS image_url
    UNION ALL
    SELECT 1105 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_a6e0343d-9780-4041-b9bb-cb98099c8df55286642900198114815.jpg' AS image_url
    UNION ALL
    SELECT 1106 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_ac533af0-912c-408f-bf39-70587c1e7c4f6571646968623654107.jpg' AS image_url
    UNION ALL
    SELECT 1107 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_fbad64a7-8fd8-404d-a88d-1417b65cc55d7309588089959235890.jpg' AS image_url
    UNION ALL
    SELECT 1108 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_04722332-5992-481c-8622-33f42250e3204785260765135793397.jpg' AS image_url
    UNION ALL
    SELECT 1109 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_f1827afb-ed4c-4bd2-bdb6-418da51813a76011490767829993459.jpg' AS image_url
    UNION ALL
    SELECT 1112 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_d567399c-6fae-4fe6-8355-59192722e3741063207869926921600.jpg' AS image_url
    UNION ALL
    SELECT 1113 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_e10a9e26-e877-443f-9915-2d5c0cc3bf976334271870549966371.jpg' AS image_url
    UNION ALL
    SELECT 1114 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_c13682d7-fd91-46b2-b488-478322ad58658798333607304045317.jpg' AS image_url
    UNION ALL
    SELECT 1116 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_35d80516-9502-4c1a-a01a-46d1a822e4c5803633094994421412.jpg' AS image_url
    UNION ALL
    SELECT 1120 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_07293cf4-66e7-482a-a24e-ea8d99075b185822488859674690469.jpg' AS image_url
    UNION ALL
    SELECT 1124 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_cb200cc1-de81-4fcf-b5c1-575a7b8aef0d1868528731499513879.jpg' AS image_url
    UNION ALL
    SELECT 1125 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_8f84dc34-7629-4a38-8aa8-3e360c4d3b1f4752136040057473308.jpg' AS image_url
    UNION ALL
    SELECT 1126 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_428a46b4-737c-4368-8fcd-ac56eb97acfc8096219335554743476.jpg' AS image_url
    UNION ALL
    SELECT 1127 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_cf40ad0e-c54a-460a-8be6-46affe2ea0277805399687406169304.jpg' AS image_url
    UNION ALL
    SELECT 1128 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_f656bb2f-8988-4357-922a-51d102025e636406597834784130233.jpg' AS image_url
    UNION ALL
    SELECT 1129 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_cce63a61-9bae-42bb-815a-98062da99b7b8089051437745178305.jpg' AS image_url
    UNION ALL
    SELECT 1130 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_bc016323-a425-4531-859f-3c317d481a751149311727650419881.jpg' AS image_url
    UNION ALL
    SELECT 1131 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_7013300e-b576-4e00-bfc9-886d6ac638e08210462177970847051.jpg' AS image_url
    UNION ALL
    SELECT 1132 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_3fb41e84-f01e-4425-a71a-2503be47ade24030098513816657447.jpg' AS image_url
    UNION ALL
    SELECT 1133 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_dc2bbc9b-3017-4776-9e72-68125d92437b3611252009511816923.jpg' AS image_url
    UNION ALL
    SELECT 1134 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_2813270c-ba38-476a-b75d-5fde1ca9cf4c7092494948240707034.jpg' AS image_url
    UNION ALL
    SELECT 1138 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_ad9ada85-f776-4af6-bc53-de1eb25ef8405847121780999913337.jpg' AS image_url
    UNION ALL
    SELECT 1139 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_0381d7a5-4f83-4a95-92ba-a90bb948ef1c5548171428455427342.jpg' AS image_url
    UNION ALL
    SELECT 1140 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_4ffa0026-4f0c-438d-87aa-1e12ede0968e8783608355750859721.jpg' AS image_url
    UNION ALL
    SELECT 1151 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_8e4ede4f-7c50-4c4b-b2e7-585387326f906381138925065230614.jpg' AS image_url
    UNION ALL
    SELECT 1152 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_92c819a2-1456-48a6-9f08-0ca864715e2b6313451840725888887.jpg' AS image_url
    UNION ALL
    SELECT 1153 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_68544f67-b5ee-4a04-a73e-86b06b79c7904727041967759405131.jpg' AS image_url
    UNION ALL
    SELECT 1154 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_2b847786-98b8-470f-8d5c-88f8d27814081082288273242430273.jpg' AS image_url
    UNION ALL
    SELECT 1155 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_329e8edf-9450-41cb-9628-74e9eeacbdf84354579968040788556.jpg' AS image_url
    UNION ALL
    SELECT 1156 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_6ee1f620-3daa-493d-8f3c-7086f9da0d2144133712416023872.jpg' AS image_url
    UNION ALL
    SELECT 1157 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_9f242ddf-d27c-4317-afde-96695c2a839a3851059300414560494.jpg' AS image_url
    UNION ALL
    SELECT 1158 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_3587af92-f47e-44cf-b01c-76df7d9983dd3936901039831900969.jpg' AS image_url
    UNION ALL
    SELECT 1159 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_fd63827b-9543-4c44-8c1a-0d6e1eb4680a6317068032858868808.jpg' AS image_url
    UNION ALL
    SELECT 1160 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_88187a70-fc54-42dd-85a1-22cd79f09fca2987921500234988437.jpg' AS image_url
    UNION ALL
    SELECT 1161 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_cbe3a084-58a2-4803-8ae0-3bbda14fdacb7537427046013401604.jpg' AS image_url
    UNION ALL
    SELECT 1162 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_5ca938ae-66db-4980-a56e-11f5df8f52054431201468313639330.jpg' AS image_url
    UNION ALL
    SELECT 1163 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_01c98ab6-5abf-47af-b409-cc7c7b19ce7a6793504973937146026.jpg' AS image_url
    UNION ALL
    SELECT 1164 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_b6034765-ef71-42bb-93c6-77d7e4d511029079539396638620093.jpg' AS image_url
    UNION ALL
    SELECT 1166 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_5c88c3ec-9f3e-47f6-ada6-049a4be821626308958191274320719.jpg' AS image_url
    UNION ALL
    SELECT 1167 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_f8e14119-4992-489f-aed8-864b6e7a14e53547893177283988402.jpg' AS image_url
    UNION ALL
    SELECT 1168 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_8a8cf1d5-1236-4def-89db-a46101aa32f75700919024528962321.jpg' AS image_url
    UNION ALL
    SELECT 1169 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_7af36369-615c-4c95-9ee1-d714a860eeca1979236314475704365.jpg' AS image_url
    UNION ALL
    SELECT 1170 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_616f0e75-1ead-47ed-9fe2-3997b0d383bd5304913046837599712.jpg' AS image_url
    UNION ALL
    SELECT 1171 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_cbc55843-9001-4c84-b7c8-5b84fbd5e88f4436035069114806318.jpg' AS image_url
    UNION ALL
    SELECT 1172 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_dc56193b-b115-4935-94b2-410d56beb2f73211164011666575639.jpg' AS image_url
    UNION ALL
    SELECT 1174 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7201/insta_assets_crop_60d60f2d-d1fb-4372-9d7b-f7b6a4512bed7954668949290534142.jpg' AS image_url
    UNION ALL
    SELECT 1175 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3086/insta_assets_crop_021bb79c-3f19-4bb0-8d09-3a476ad3e7eb6396667845145238730.jpg' AS image_url
    UNION ALL
    SELECT 1176 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3086/insta_assets_crop_9280f86c-a950-4844-9f31-7d2f45c5ec7d8684857920240662228.jpg' AS image_url
    UNION ALL
    SELECT 1177 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3086/insta_assets_crop_9ba12f7c-dca0-4786-8fb8-669764f1de112746273407171684960.jpg' AS image_url
    UNION ALL
    SELECT 1178 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3086/insta_assets_crop_405ab131-6679-4cc6-84f4-4e6d95c9180b4531145364842853949.jpg' AS image_url
    UNION ALL
    SELECT 1179 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3086/insta_assets_crop_9bd364e2-f94b-4431-a2c2-2301cb47d5f8600012619008144579.jpg' AS image_url
    UNION ALL
    SELECT 1180 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3086/insta_assets_crop_c8afcee6-f70a-44c6-91c1-048a8d7bd5e05329689575921498230.jpg' AS image_url
    UNION ALL
    SELECT 1182 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3086/insta_assets_crop_9aa4168a-3679-4796-8412-e228f42693b26682772371624084924.jpg' AS image_url
    UNION ALL
    SELECT 1183 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3086/insta_assets_crop_f2140d39-43bf-4299-8e7f-972c8aabe6561688727899755916541.jpg' AS image_url
    UNION ALL
    SELECT 1184 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3086/insta_assets_crop_74ed17c6-a802-4030-a796-8c3fb922cfdb5593943554775801569.jpg' AS image_url
    UNION ALL
    SELECT 1187 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6397/insta_assets_crop_ddfd31df-a2b7-4f29-b8c5-03b991daadaf667915927336353727.jpg' AS image_url
    UNION ALL
    SELECT 1188 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6388/insta_assets_crop_3a422cc0-7b5a-43f5-8868-7e19d4c15c297823543406999307470.jpg' AS image_url
    UNION ALL
    SELECT 1189 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7218/insta_assets_crop_5fb80a91-4105-4a58-9e87-f7de5c3fe8723794934190623654775.jpg' AS image_url
    UNION ALL
    SELECT 1190 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4953/scaled_c5b6a60b-018f-4b88-b338-af76acd7897b6167071537426972489.jpg' AS image_url
    UNION ALL
    SELECT 1191 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4953/scaled_a282ce8f-c790-4911-ae8f-fd5cc3fc382c5305558359784306346.jpg' AS image_url
    UNION ALL
    SELECT 1192 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4953/scaled_c39ee6a4-5475-4787-943e-fbaf18fd19f87228436208286534071.jpg' AS image_url
    UNION ALL
    SELECT 1193 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4953/scaled_d7a020a7-8b24-4359-be11-b2011e91f0c06322780595862531079.jpg' AS image_url
    UNION ALL
    SELECT 1194 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4953/scaled_38ef0e12-75fc-4016-aadf-62061d5aee698428165651491093660.jpg' AS image_url
    UNION ALL
    SELECT 1195 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7222/insta_assets_crop_7fbff44c-b853-4721-9de1-cdbb13ba7b462843730889234311160.jpg' AS image_url
    UNION ALL
    SELECT 1196 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7223/insta_assets_crop_0e67288e-118d-44c5-bafe-a86ad0dea5146530087894337556038.jpg' AS image_url
    UNION ALL
    SELECT 1201 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7224/insta_assets_crop_7db90ac6-ad4b-4c96-b5dc-e92ae430d4747120604487420324369.jpg' AS image_url
    UNION ALL
    SELECT 1205 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/632/insta_assets_crop_d96ffd16-2001-4c22-8b41-21c562fef3823045063987830095008.jpg' AS image_url
    UNION ALL
    SELECT 1206 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7226/insta_assets_crop_81c8874a-9f34-4e94-8160-6fd92546009d5863745414131781832.jpg' AS image_url
    UNION ALL
    SELECT 1207 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7228/insta_assets_crop_863123f0-13af-4c7f-a8db-8361b45bd66c9161348496926710720.jpg' AS image_url
    UNION ALL
    SELECT 1208 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7228/insta_assets_crop_acaa1db1-6012-438f-8d0b-38dcbc98b5f14504983601745211371.jpg' AS image_url
    UNION ALL
    SELECT 1209 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7229/insta_assets_crop_efcd0f6d-1cfa-44d1-99af-00aa83d9773c2640986824497984014.jpg' AS image_url
    UNION ALL
    SELECT 1210 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7229/insta_assets_crop_0e267ef6-c4c5-467a-a759-a3fb43dbad8a7398997548819527635.jpg' AS image_url
    UNION ALL
    SELECT 1211 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7229/insta_assets_crop_61a6a3c9-ffb1-46f7-8361-b5d51b8e22258102864495385037934.jpg' AS image_url
    UNION ALL
    SELECT 1212 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7229/insta_assets_crop_0dae6012-d79e-4cfb-8ed4-eb86cbcfa2197518995627338854547.jpg' AS image_url
    UNION ALL
    SELECT 1213 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_bf99bb60-9a33-4a87-b030-bae2c8230f6a3914183017674029750.jpg' AS image_url
    UNION ALL
    SELECT 1214 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_ad559ba4-dcc7-48bc-a463-1c856d7e392d2746955629605974264.jpg' AS image_url
    UNION ALL
    SELECT 1215 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_ca1f5227-4172-4943-81eb-87aa2f8db4bc1875683558035421811.jpg' AS image_url
    UNION ALL
    SELECT 1216 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_94c211d5-bb62-429b-b1e9-c28d9906f58d3029810360876950922.jpg' AS image_url
    UNION ALL
    SELECT 1217 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_be5d5a79-4750-4479-bed0-0df1151e9b7a4905577446773131192.jpg' AS image_url
    UNION ALL
    SELECT 1218 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_22a9fce4-6b7d-400e-8979-4279b05a02e34359825118575213826.jpg' AS image_url
    UNION ALL
    SELECT 1219 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_2806d1b2-62ee-4df1-893d-a63fd8d8ca446156512674768149227.jpg' AS image_url
    UNION ALL
    SELECT 1220 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_79e28fd5-fba5-4ef9-b2bc-1ffc6969c7ea864588020684083972.jpg' AS image_url
    UNION ALL
    SELECT 1223 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_a903ac1e-8991-4e42-b526-59d80e07112a4605344763407019895.jpg' AS image_url
    UNION ALL
    SELECT 1224 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_975e677e-39d1-475f-9fc7-14cc2fbc6e3a177614951523800366.jpg' AS image_url
    UNION ALL
    SELECT 1225 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7230/insta_assets_crop_cf88ac96-490c-4f74-8cf7-41089ebe6df94509105411711848501.jpg' AS image_url
    UNION ALL
    SELECT 1226 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7230/insta_assets_crop_b59897d8-028b-496c-98d7-db4808b844686322335072507620129.jpg' AS image_url
    UNION ALL
    SELECT 1227 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7230/insta_assets_crop_a3ebb556-fd33-4be6-bf21-501da809a86c72887610670849604.jpg' AS image_url
    UNION ALL
    SELECT 1228 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7230/insta_assets_crop_b1462256-edf8-460a-aa41-7e49859a50754946228784210602047.jpg' AS image_url
    UNION ALL
    SELECT 1229 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7230/insta_assets_crop_4ba65ee5-6afb-414b-8bc0-62dac9ac8d718208976625717822426.jpg' AS image_url
    UNION ALL
    SELECT 1230 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_1e96e169-e4e7-40f3-81d5-c8e28bc5a8473191073082286220424.jpg' AS image_url
    UNION ALL
    SELECT 1231 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_28eedb1d-4452-45ee-931c-ee67973d26b0566768535602498071.jpg' AS image_url
    UNION ALL
    SELECT 1232 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_0f49a1c7-0259-40c9-819e-58d1fcc2a1a56151675651623659010.jpg' AS image_url
    UNION ALL
    SELECT 1233 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7232/insta_assets_crop_cc5dad46-082b-4705-a9e4-45d08b93a1b32529603019873050385.jpg' AS image_url
    UNION ALL
    SELECT 1234 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_277a9f9f-dc43-4e1c-a7c3-70eb718e88585388163756408280986.jpg' AS image_url
    UNION ALL
    SELECT 1236 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_431e42ce-ce3e-4904-a80a-ddeb0a0ab7b64506369963972536074.jpg' AS image_url
    UNION ALL
    SELECT 1237 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_f7687435-f2a6-4432-aa9b-6195972923a04376542286800633026.jpg' AS image_url
    UNION ALL
    SELECT 1238 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_5144186f-6ce7-4c52-913d-e2f346e5e8bb572222096552096711.jpg' AS image_url
    UNION ALL
    SELECT 1239 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_098467a7-414a-4f0b-8ac7-ff70788d7ba96456439917888686039.jpg' AS image_url
    UNION ALL
    SELECT 1240 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/209/insta_assets_crop_0a3dfd14-f8a4-4ddb-96f4-572b8576c78c2792712530848887147.jpg' AS image_url
    UNION ALL
    SELECT 1241 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7233/insta_assets_crop_6c3bf8cd-7a9f-4a3e-95e8-ca4f5cd4afa96926706265743975706.jpg' AS image_url
    UNION ALL
    SELECT 1242 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7234/insta_assets_crop_8dd24a4a-40aa-473a-a260-01f0d8e01efe6922740566040178183.jpg' AS image_url
    UNION ALL
    SELECT 1243 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7236/insta_assets_crop_945bd909-9955-4742-8be9-3c26d6b0fc3a4692067138803135795.jpg' AS image_url
    UNION ALL
    SELECT 1244 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7236/insta_assets_crop_77da788e-c6af-4975-bdf4-95b797f0007f4521384467903470677.jpg' AS image_url
    UNION ALL
    SELECT 1245 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7236/insta_assets_crop_eb4c8e22-7c9f-4380-b5af-bd48be22fdcd8252484697584410266.jpg' AS image_url
    UNION ALL
    SELECT 1246 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7236/insta_assets_crop_5dd00255-8d37-4035-875d-135ca2daa2742555063369304080397.jpg' AS image_url
    UNION ALL
    SELECT 1247 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7236/insta_assets_crop_23fc5497-98f2-4746-bcd8-2d6f98e3ccc83585973274221324911.jpg' AS image_url
    UNION ALL
    SELECT 1248 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7235/insta_assets_crop_30e40ca6-375d-4bf0-b837-bb5433656c1c511282608967713597.jpg' AS image_url
    UNION ALL
    SELECT 1249 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/21/insta_assets_crop_d3ece9c5-12d5-4a60-9de1-23815fe9c2869101356780933665625.jpg' AS image_url
    UNION ALL
    SELECT 1250 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/21/insta_assets_crop_b4a69606-a6e5-4cc3-8178-c33ceef370d32532829995373851141.jpg' AS image_url
    UNION ALL
    SELECT 1251 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2059/insta_assets_crop_59a478aa-9f07-48fa-bbd3-500371ad99426335315088601556271.jpg' AS image_url
    UNION ALL
    SELECT 1252 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7237/image_picker_4338D012-2826-4954-A858-C0EE06B4017E-34601-000010B3486B86EF.jpg' AS image_url
    UNION ALL
    SELECT 1273 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6404/insta_assets_crop_2526be3e-9d75-4997-a929-915391e183124287695755308678283.jpg' AS image_url
    UNION ALL
    SELECT 1275 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_5f21627a-0e06-4bff-8950-82fdb2d917c48719779596090572062.jpg' AS image_url
    UNION ALL
    SELECT 1276 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_790f5471-681e-4842-bc29-456243e62e294152113213508888090.jpg' AS image_url
    UNION ALL
    SELECT 1277 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6404/insta_assets_crop_95a78f9a-3070-4bc1-8293-55332899e1087920241532589222503.jpg' AS image_url
    UNION ALL
    SELECT 1278 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6404/insta_assets_crop_2830f9b3-1f56-49ed-aa54-0a0f1d1fb4eb1641333270728047038.jpg' AS image_url
    UNION ALL
    SELECT 1279 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6404/insta_assets_crop_2df02871-e1b5-4c74-9650-18670ff7e7c88569454710436955192.jpg' AS image_url
    UNION ALL
    SELECT 1280 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_0315abd5-d6eb-4bfb-bdb5-b3984f6487543158058401014824102.jpg' AS image_url
    UNION ALL
    SELECT 1281 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7250/insta_assets_crop_481DAE84-DFE8-4FB6-9062-3D477509AE0E-14250-00000BD76871BB10.jpg' AS image_url
    UNION ALL
    SELECT 1284 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_12670147-55db-4f53-be02-ec55f6ec59858109305061771022212.jpg' AS image_url
    UNION ALL
    SELECT 1285 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_6474570e-63b6-4574-bf04-49f5dc8f60493773581105019071243.jpg' AS image_url
    UNION ALL
    SELECT 1286 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_df093cb4-b785-4a6a-b2f2-6c1d1a76a52223466999510862935.jpg' AS image_url
    UNION ALL
    SELECT 1287 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_8c54ef26-843a-42d3-9bbd-4694c1267d342149674315785008726.jpg' AS image_url
    UNION ALL
    SELECT 1288 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_e98a09bf-a88a-4c54-82f0-fc9c0019bae7742788131977799348.jpg' AS image_url
    UNION ALL
    SELECT 1289 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_50ab907b-9f44-4083-bed8-7c3d7ca06ee86395012846270229120.jpg' AS image_url
    UNION ALL
    SELECT 1290 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6404/insta_assets_crop_97c6ae64-76a1-411a-a7aa-9bb8d05de8939110409602188333778.jpg' AS image_url
    UNION ALL
    SELECT 1291 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_81965965-17ea-4c76-a9d4-1f3bd0297de62224836739723384557.jpg' AS image_url
    UNION ALL
    SELECT 1292 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_86723454-de30-40c1-a599-f286fb07e99d3953934297023712914.jpg' AS image_url
    UNION ALL
    SELECT 1293 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_12d243ab-11dc-4ca1-a5d2-a4af858eac6d8068084714003021815.jpg' AS image_url
    UNION ALL
    SELECT 1294 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_20e5e261-3982-4cc7-b1cd-fe00d1200eaf7539564768386372512.jpg' AS image_url
    UNION ALL
    SELECT 1295 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3676/insta_assets_crop_fec98b26-e904-4ec9-a86f-603c5318c7176307595261718406006.jpg' AS image_url
    UNION ALL
    SELECT 1296 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6404/insta_assets_crop_7bc2694c-fa15-47a2-b8af-d262f259fcce5985347185566431212.jpg' AS image_url
    UNION ALL
    SELECT 1297 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6404/insta_assets_crop_c2a2111b-17a3-4662-a138-92cc51536b2a2082148923982852120.jpg' AS image_url
    UNION ALL
    SELECT 1298 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7251/insta_assets_crop_3e997187-338f-4847-b5d3-f302a1aaf0a54121339198898677043.jpg' AS image_url
    UNION ALL
    SELECT 1299 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6404/insta_assets_crop_5126b945-85f5-479b-bbdc-4c25323cb6d5694699634019252700.jpg' AS image_url
    UNION ALL
    SELECT 1300 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6404/insta_assets_crop_7d199b6f-668a-46bb-aa3b-a5eb8ef486e6649359202722529179.jpg' AS image_url
    UNION ALL
    SELECT 1302 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6404/insta_assets_crop_6a42d4dc-4169-4257-b637-a6b156480ce3588386144511770262.jpg' AS image_url
    UNION ALL
    SELECT 1303 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6397/insta_assets_crop_7f7163ec-1105-4d7b-ab34-46dfad4b80ba5239212885185430401.jpg' AS image_url
    UNION ALL
    SELECT 1304 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1220/insta_assets_crop_bdc92db5-8b94-49ed-b392-371fef8603164555317135840424763.jpg' AS image_url
    UNION ALL
    SELECT 1305 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1220/insta_assets_crop_131a411a-2647-441a-9c17-aa7b8fe0f0e03148208267686916130.jpg' AS image_url
    UNION ALL
    SELECT 1306 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1220/insta_assets_crop_c09ed3d3-9c9c-4d6a-a2ea-2ad0baa03eb26661145537605444055.jpg' AS image_url
    UNION ALL
    SELECT 1307 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7255/insta_assets_crop_c19da914-b4ed-49fe-98b4-07b4249d32082508785836072827565.jpg' AS image_url
    UNION ALL
    SELECT 1308 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6392/insta_assets_crop_cd218846-88e9-4abe-a023-38801c4dda2c4495269997160446593.jpg' AS image_url
    UNION ALL
    SELECT 1309 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6392/insta_assets_crop_b9ea597b-479d-474c-837c-9e9f4bca9f721665877663374217845.jpg' AS image_url
    UNION ALL
    SELECT 1310 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7191/insta_assets_crop_66e76c19-2e9c-442c-a186-aeacd956ab7a8469065885204830748.jpg' AS image_url
    UNION ALL
    SELECT 1311 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7191/insta_assets_crop_11f2a2df-abb6-47f7-8324-c3bcdcea52ba1113493289446282799.jpg' AS image_url
    UNION ALL
    SELECT 1313 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5320/insta_assets_crop_f9cf0e44-745e-4b9c-9024-fbec44e194d5196321888112326371.jpg' AS image_url
    UNION ALL
    SELECT 1314 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_774330aa-4948-45ec-80c1-8daa031187b62495823167512799890.jpg' AS image_url
    UNION ALL
    SELECT 1315 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6545/insta_assets_crop_a48f29d0-09ea-4ed5-94c1-52d883c78fa73435893234989568533.jpg' AS image_url
    UNION ALL
    SELECT 1316 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6545/insta_assets_crop_4d1eb4bd-14a0-4b83-8f57-4e08c92790b25291131787707562977.jpg' AS image_url
    UNION ALL
    SELECT 1317 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6545/insta_assets_crop_aab9cfbf-77cb-4ec5-9d8b-eeac7536d4408082273777596061736.jpg' AS image_url
    UNION ALL
    SELECT 1318 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6545/insta_assets_crop_5cd0cd0b-e61a-447c-8099-85f5d5577a4a2504617838634624540.jpg' AS image_url
    UNION ALL
    SELECT 1319 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6545/insta_assets_crop_a3f98e5b-fc9f-449d-9fa8-5c30baaef62f8456878980467012491.jpg' AS image_url
    UNION ALL
    SELECT 1320 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6545/insta_assets_crop_4ac1f789-f4f1-40e3-a38f-f6ed49f458965503701057780201444.jpg' AS image_url
    UNION ALL
    SELECT 1321 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6545/insta_assets_crop_c1ca4180-0859-457a-b8a9-cd1ccea36cef1724914176680833933.jpg' AS image_url
    UNION ALL
    SELECT 1322 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6545/insta_assets_crop_8c3e4bd6-10a5-46b4-aa01-4fddf67eed152190527341227390031.jpg' AS image_url
    UNION ALL
    SELECT 1323 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6545/insta_assets_crop_19a6a68b-7d89-4cb5-bfe1-018bdaafc5531373158439608008691.jpg' AS image_url
    UNION ALL
    SELECT 1324 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6545/insta_assets_crop_8744fc92-1383-46a0-888c-5a0b2938c6d24298407442915503446.jpg' AS image_url
    UNION ALL
    SELECT 1325 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3405/insta_assets_crop_68c79f8c-e7d0-40f1-a975-394ea0d386072758819907392255423.jpg' AS image_url
    UNION ALL
    SELECT 1326 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7262/insta_assets_crop_6f1a4feb-af43-41c2-b3ba-93b5440d545c8334685647456531797.jpg' AS image_url
    UNION ALL
    SELECT 1327 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_dc89a321-10fa-4cdc-aa1f-78d17f785ee86426794239995783712.jpg' AS image_url
    UNION ALL
    SELECT 1328 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_5c9ebc8d-f6ea-4e4d-8899-7516c34b53ff334121431846007122.jpg' AS image_url
    UNION ALL
    SELECT 1329 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_e5819f4d-27b3-4cb8-a948-864d233acd5d8253227378525061285.jpg' AS image_url
    UNION ALL
    SELECT 1330 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_709c8f43-28ef-4d68-a5c7-2eee97e80d507657207068438946987.jpg' AS image_url
    UNION ALL
    SELECT 1331 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_4c7a03a9-df6e-466d-a666-3bf2b6f0ac0d3396312146259984127.jpg' AS image_url
    UNION ALL
    SELECT 1332 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_8246251e-a739-4aa8-bb23-783b1a7866312831949502789225851.jpg' AS image_url
    UNION ALL
    SELECT 1333 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_0baef0d8-2bcf-4bac-b707-a4f5b2cc24a06627030713403383966.jpg' AS image_url
    UNION ALL
    SELECT 1334 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7263/insta_assets_crop_6a4f658f-4b1f-4e5d-9a76-8f93a70fc56c4922596818197025659.jpg' AS image_url
    UNION ALL
    SELECT 1335 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_a913cc0b-b42b-4ab3-b0bd-25d51d25d3f14182702698527208563.jpg' AS image_url
    UNION ALL
    SELECT 1336 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_6dc0bb72-2aa7-4c4a-a211-53be38305eb77510783339792535899.jpg' AS image_url
    UNION ALL
    SELECT 1337 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_a203c2aa-91be-42a0-b6ea-53353e637ed26768538277026865576.jpg' AS image_url
    UNION ALL
    SELECT 1338 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_e08f0eeb-981b-4835-b937-ece6f402a8a64173985281338280571.jpg' AS image_url
    UNION ALL
    SELECT 1339 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_520b6dec-b30c-4711-a68f-96eeefe135328384279123080785575.jpg' AS image_url
    UNION ALL
    SELECT 1340 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7264/insta_assets_crop_05574687-5369-4699-96a3-2faae57326cd7739682076006737115.jpg' AS image_url
    UNION ALL
    SELECT 1341 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/600/insta_assets_crop_ba636d7a-5638-48a7-b22a-8988a469d6d93749585313587370556.jpg' AS image_url
    UNION ALL
    SELECT 1342 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_3a81550f-d00f-4d5d-aea2-1972c74c97ed8665519648090163452.jpg' AS image_url
    UNION ALL
    SELECT 1343 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_90a8a785-4603-4097-bbfd-985f8365aec53516003187190661510.jpg' AS image_url
    UNION ALL
    SELECT 1344 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7265/insta_assets_crop_6f70fc84-976f-44bc-96bf-c9cb555b1e166656712002870155425.jpg' AS image_url
    UNION ALL
    SELECT 1345 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_388b5e71-176a-41ee-a44d-21cab1dfde7a6108015327127256541.jpg' AS image_url
    UNION ALL
    SELECT 1346 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_029421f6-738e-4a26-8517-42b64b69ca01449671118410265902.jpg' AS image_url
    UNION ALL
    SELECT 1347 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_e3700dfe-58fd-4b71-a524-727d026c2f693205372647149213451.jpg' AS image_url
    UNION ALL
    SELECT 1348 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_a0f34d70-37ef-4ca8-ae3f-bba85e9f62872375457704582812040.jpg' AS image_url
    UNION ALL
    SELECT 1349 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_de65331c-8fca-41c7-b35d-5d4711238b258463600843379699115.jpg' AS image_url
    UNION ALL
    SELECT 1350 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_a295bdf9-1b3c-4f22-92d3-12b94d070ee28032324910972300776.jpg' AS image_url
    UNION ALL
    SELECT 1351 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_d554aa3c-83ba-41d5-a455-b2a40729249e603442148520425021.jpg' AS image_url
    UNION ALL
    SELECT 1352 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_73398a97-52f8-4697-b6c2-29f8f31dbdd0533745373529140631.jpg' AS image_url
    UNION ALL
    SELECT 1353 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_1060d567-d993-4baf-b83c-99a01c6546913483266633983536270.jpg' AS image_url
    UNION ALL
    SELECT 1354 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_8aef6a48-0ee1-4b17-80a9-e6f9ddac42dc4393561990288923925.jpg' AS image_url
    UNION ALL
    SELECT 1355 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_5a5f8ca6-b39f-4cd7-bdaa-1216dbc5eaf92972245719367612907.jpg' AS image_url
    UNION ALL
    SELECT 1356 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_1c672f3b-8729-45b0-a324-b96e07eb58175468764577877549503.jpg' AS image_url
    UNION ALL
    SELECT 1362 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_a1dbcf6d-ad98-4754-9488-6b830ee6ed279155139216776862394.jpg' AS image_url
    UNION ALL
    SELECT 1363 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_723f3569-9c8b-4d95-9906-5626dad652b13714707868055292977.jpg' AS image_url
    UNION ALL
    SELECT 1364 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_a4d6156a-1883-4bb8-a086-47a50d2bbc5b8378662702168086825.jpg' AS image_url
    UNION ALL
    SELECT 1367 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_1d196565-1d70-4e88-bed3-aa4a97fcca521823743415599927805.jpg' AS image_url
    UNION ALL
    SELECT 1368 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_ed08a02c-c172-4454-99ba-d5131e5585051436848168239870292.jpg' AS image_url
    UNION ALL
    SELECT 1369 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_89611e67-020e-4dc0-ae35-3eae4dea75663648524824706481584.jpg' AS image_url
    UNION ALL
    SELECT 1370 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_de859656-b8e7-4e51-99d1-ddc8b20bdba26747847911818923904.jpg' AS image_url
    UNION ALL
    SELECT 1371 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_855fc4ac-3fc1-4423-92b3-cd4ca09bd56d1861360726296164895.jpg' AS image_url
    UNION ALL
    SELECT 1374 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7260/insta_assets_crop_284d40a2-fe9b-4ef0-9257-687e3c8e13bf7850891376005558916.jpg' AS image_url
    UNION ALL
    SELECT 1375 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7266/insta_assets_crop_8f64a14f-2283-4014-b0ff-39bb81d00d53387323153598241966.jpg' AS image_url
    UNION ALL
    SELECT 1376 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7267/insta_assets_crop_077ba3bb-b7a3-4341-b833-0164827fd81f1512192855048662850.jpg' AS image_url
    UNION ALL
    SELECT 1377 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7268/insta_assets_crop_36c48a43-65b5-4248-9940-a9c5ee36a83c614730967580436506.jpg' AS image_url
    UNION ALL
    SELECT 1378 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6578/scaled_2e4627cd-be3b-47ff-b956-6354ada93e734401285282439584533.jpg' AS image_url
    UNION ALL
    SELECT 1379 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_46e7c069-835c-4809-8414-18d90805f062182843383692467221.jpg' AS image_url
    UNION ALL
    SELECT 1381 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_1678b15d-c4e1-407a-9c05-c69efbd445883659093033245007022.jpg' AS image_url
    UNION ALL
    SELECT 1382 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_db4d9cdb-35e2-43ca-8e20-d70ff23f47827585874426874444663.jpg' AS image_url
    UNION ALL
    SELECT 1383 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_c98b6187-ccdc-4551-bf3b-eff3569334422601035238217769437.jpg' AS image_url
    UNION ALL
    SELECT 1384 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2101/insta_assets_crop_da485190-c609-4617-8bc9-615a19ed7f7d66648341665822317.jpg' AS image_url
    UNION ALL
    SELECT 1385 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_6c21f2f4-6b07-4a4a-897e-c3b9d6f2b7037502972745639134061.jpg' AS image_url
    UNION ALL
    SELECT 1386 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_3798499a-eede-4779-a706-d61570be94cb5867607762150838186.jpg' AS image_url
    UNION ALL
    SELECT 1387 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_281e3fca-d5c7-44bb-be23-75f0e99c04b25172891893793799889.jpg' AS image_url
    UNION ALL
    SELECT 1388 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_2e946d1d-739c-4e2e-9bdd-bb8f7c884dab5381825266880476537.jpg' AS image_url
    UNION ALL
    SELECT 1389 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_b2b5db71-73af-4fd8-bdfa-cdcab0b7f5375971062404828308582.jpg' AS image_url
    UNION ALL
    SELECT 1390 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7272/insta_assets_crop_263e2341-3075-4fd0-8cfa-a8191c060e9a4462682602954047268.jpg' AS image_url
    UNION ALL
    SELECT 1391 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_71d5e8b4-a2df-4281-85e0-233a67ee6653866072372243862992.jpg' AS image_url
    UNION ALL
    SELECT 1392 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_3c1e02b4-6c58-4267-92af-edb0d5c4a43e4769911554681800801.jpg' AS image_url
    UNION ALL
    SELECT 1393 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_51392b1d-821d-4243-8cf8-c2f84a7cda356290418427203835899.jpg' AS image_url
    UNION ALL
    SELECT 1394 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_adf1f712-6462-473e-af15-8a374cf0a4df2955716984357086646.jpg' AS image_url
    UNION ALL
    SELECT 1395 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_1fc73c77-ad7a-4230-8a9e-32dd11940cd22081032807961879413.jpg' AS image_url
    UNION ALL
    SELECT 1396 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_5f05ac7f-bcff-4ba2-9200-255fcdc43aca1694085950302546495.jpg' AS image_url
    UNION ALL
    SELECT 1397 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_5d79370e-b6cf-4f01-a158-ad189b4fc64e7026069634386582409.jpg' AS image_url
    UNION ALL
    SELECT 1398 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_95b8b113-f763-4ed5-9ebe-ced158ada0934020004351881624177.jpg' AS image_url
    UNION ALL
    SELECT 1399 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_50d5b799-dabd-44e5-9b14-e025a73438a47919628584084431501.jpg' AS image_url
    UNION ALL
    SELECT 1400 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4701/insta_assets_crop_135bd577-42c4-48cb-b100-9f0131456f145428792671770114212.jpg' AS image_url
    UNION ALL
    SELECT 1401 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7247/insta_assets_crop_28c8c84e-97c8-43b2-bb72-2d9f047fc8d92437043530281070029.jpg' AS image_url
    UNION ALL
    SELECT 1403 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7247/insta_assets_crop_299c16f9-6643-4da3-8b82-00c566757c3e506447279438653120.jpg' AS image_url
    UNION ALL
    SELECT 1405 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7247/insta_assets_crop_73435b01-36d9-4803-8898-5edb46053585719357698547370974.jpg' AS image_url
    UNION ALL
    SELECT 1406 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7275/insta_assets_crop_743f0044-91f7-46c7-9daa-d47efb5eb5508048445462911026870.jpg' AS image_url
    UNION ALL
    SELECT 1407 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7275/insta_assets_crop_8bf7865c-f682-4a63-a503-39dc4817ca151007419643057381377.jpg' AS image_url
    UNION ALL
    SELECT 1408 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7275/insta_assets_crop_b1f621ed-2ad5-4793-bb48-e5ba25da530c4176055139140041834.jpg' AS image_url
    UNION ALL
    SELECT 1409 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_8410ad5b-8a9c-4d5c-8e7d-c8cb2de9d9dc3324305737238528320.jpg' AS image_url
    UNION ALL
    SELECT 1410 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_be866af9-fdc3-4ff4-9e0a-514815ac6c188575156807692553612.jpg' AS image_url
    UNION ALL
    SELECT 1411 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_be866af9-fdc3-4ff4-9e0a-514815ac6c188575156807692553612.jpg' AS image_url
    UNION ALL
    SELECT 1412 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_b5203dc4-a099-4f70-909b-1783bb9b57957230813727031692274.jpg' AS image_url
    UNION ALL
    SELECT 1413 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_d02ebeca-1526-4f0e-8bae-1e6705d9f25a3822440448810574663.jpg' AS image_url
    UNION ALL
    SELECT 1414 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_ff23ba75-df58-47d2-a09d-92c1275652cc3368778436670606656.jpg' AS image_url
    UNION ALL
    SELECT 1415 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_027b5862-9ad7-4930-a9d5-0bec301cded94395079130487607822.jpg' AS image_url
    UNION ALL
    SELECT 1416 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_d3ffc8fa-e7e0-4afb-896f-782b8f2ff30a7511367184671022341.jpg' AS image_url
    UNION ALL
    SELECT 1417 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7168/insta_assets_crop_ea6b7783-bf79-4359-99a3-f6845bc87ae52984061435777512835.jpg' AS image_url
    UNION ALL
    SELECT 1418 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7168/insta_assets_crop_99d01ed7-80a3-4458-ba23-403cc844202f1852744978307352621.jpg' AS image_url
    UNION ALL
    SELECT 1419 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7168/insta_assets_crop_6147dcfc-81c5-419a-b5be-283b515d1ccf2571484917553793400.jpg' AS image_url
    UNION ALL
    SELECT 1420 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7168/insta_assets_crop_67cc0c5f-d318-4113-882c-8b18e1818971114652487950823851.jpg' AS image_url
    UNION ALL
    SELECT 1421 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7168/insta_assets_crop_38c5919f-ad54-4ff3-aeb5-64af657cbc01990324168893639375.jpg' AS image_url
    UNION ALL
    SELECT 1422 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_5277e7bd-98f9-4835-bf99-4d4d1be20dae3562039060788247079.jpg' AS image_url
    UNION ALL
    SELECT 1426 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_6940c530-7664-4267-8ad2-08b1433294723825220053583959830.jpg' AS image_url
    UNION ALL
    SELECT 1428 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_260f69ed-ac96-42dd-8c2e-23ff00065bfa8299967120567605617.jpg' AS image_url
    UNION ALL
    SELECT 1429 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_a80821ac-3a9d-4636-a71d-9db13ae7bc104807420890124220084.jpg' AS image_url
    UNION ALL
    SELECT 1430 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_3b87b149-5873-4484-b24a-7397c4d2a5904987130361298617212.jpg' AS image_url
    UNION ALL
    SELECT 1431 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_812946a7-65a6-476f-bc25-386afb0955261409650083813359116.jpg' AS image_url
    UNION ALL
    SELECT 1432 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7276/insta_assets_crop_4d667d93-fd61-44bd-84a4-d22f50cd9bf73323907428482647151.jpg' AS image_url
    UNION ALL
    SELECT 1433 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7276/insta_assets_crop_0aef4bc4-d2f4-433f-93a8-9b35cf02457a7345509836772640326.jpg' AS image_url
    UNION ALL
    SELECT 1434 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7276/insta_assets_crop_400a5ef2-5a5f-47a5-aea4-389610e23e715690699254894850645.jpg' AS image_url
    UNION ALL
    SELECT 1435 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7276/insta_assets_crop_29a97f46-9cc4-45b4-b2fb-9ac1c50d09795585776815529657227.jpg' AS image_url
    UNION ALL
    SELECT 1436 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7276/insta_assets_crop_d95b29d2-b7c7-4b38-b991-1ce0417730714196418310221020353.jpg' AS image_url
    UNION ALL
    SELECT 1437 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_41b1a4d9-926c-410d-8d04-df83237c10787997727575778114184.jpg' AS image_url
    UNION ALL
    SELECT 1438 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_4fd02316-9359-443c-ad05-cb4a5c0bcfde4445001248657592891.jpg' AS image_url
    UNION ALL
    SELECT 1439 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_9c3c0db4-7d54-4813-b412-214a0052b0aa4744303107972778040.jpg' AS image_url
    UNION ALL
    SELECT 1441 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_d5ec5963-05ca-43ab-9c8e-a6a226107fce1907906220891221965.jpg' AS image_url
    UNION ALL
    SELECT 1443 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_1e0d0096-73c4-4a22-9377-9b321f5e47843395137634806023912.jpg' AS image_url
    UNION ALL
    SELECT 1444 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_48444f9c-1d34-4bf0-804c-612700706cda3404399860713975369.jpg' AS image_url
    UNION ALL
    SELECT 1445 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_9c7a6d97-920a-4bd3-ba20-cf7b646486a31207807262861814654.jpg' AS image_url
    UNION ALL
    SELECT 1446 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2894/insta_assets_crop_2ab49bf5-c610-4c69-8755-c09aae4e90dc7757512231714846577.jpg' AS image_url
    UNION ALL
    SELECT 1447 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3873/insta_assets_crop_22bffec7-cd82-4d59-acb9-05ab5309d4a72350641871651461191.jpg' AS image_url
    UNION ALL
    SELECT 1448 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/3873/insta_assets_crop_3c83f9fc-38a9-46bb-a9c8-3ad5d32a7a295543697896803002979.jpg' AS image_url
    UNION ALL
    SELECT 1449 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7171/insta_assets_crop_1455bf98-46b9-4789-be0b-2cd6f3ef5c666638046875193084113.jpg' AS image_url
    UNION ALL
    SELECT 1450 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7171/insta_assets_crop_c14a4e0f-184b-4a10-8937-2c012b207ce16722495956789472559.jpg' AS image_url
    UNION ALL
    SELECT 1452 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7171/insta_assets_crop_b6c14b1b-b019-46b8-931a-c46f068b6f8b4873280712011266382.jpg' AS image_url
    UNION ALL
    SELECT 1453 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7171/insta_assets_crop_1ca2d5d6-5012-44e7-80ad-f9451df581512215383426881556771.jpg' AS image_url
    UNION ALL
    SELECT 1454 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_1352e570-128d-41c0-8e80-c2018c5916c92265336531534667759.jpg' AS image_url
    UNION ALL
    SELECT 1455 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_aaff8a9c-4e62-44fb-b78b-a7b965ef0e516189501949279047501.jpg' AS image_url
    UNION ALL
    SELECT 1456 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_559225c4-fa60-41a0-a7cf-dc6fe7c9916e2466364253137970655.jpg' AS image_url
    UNION ALL
    SELECT 1457 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_559225c4-fa60-41a0-a7cf-dc6fe7c9916e2466364253137970655.jpg' AS image_url
    UNION ALL
    SELECT 1458 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_8be83f37-e9f1-46fe-92ed-7fb63dac9700846190106255488176.jpg' AS image_url
    UNION ALL
    SELECT 1459 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7132/insta_assets_crop_8f9ba309-0702-4522-8076-2bd8c027a4ce3997421005921165070.jpg' AS image_url
    UNION ALL
    SELECT 1460 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7132/insta_assets_crop_02a8f014-44f4-44de-827e-bd03cfa9d4ea4664129653564625997.jpg' AS image_url
    UNION ALL
    SELECT 1461 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7132/insta_assets_crop_e33359ea-e009-44bd-8792-6c75eb9f5cbe2697420204741458522.jpg' AS image_url
    UNION ALL
    SELECT 1462 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_517bb6f3-deff-47c7-a248-7b4f849e43a04227351276578026570.jpg' AS image_url
    UNION ALL
    SELECT 1463 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_75582dcb-78c5-4299-9ae4-c5f46cfad2c0507311673959217647.jpg' AS image_url
    UNION ALL
    SELECT 1465 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7132/insta_assets_crop_86580699-de53-4516-a118-b376aa3700c87471541298179097581.jpg' AS image_url
    UNION ALL
    SELECT 1466 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7132/insta_assets_crop_7201b9f6-ca1d-48db-a6c7-04ad95cd9bd65497431664009560971.jpg' AS image_url
    UNION ALL
    SELECT 1467 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7132/insta_assets_crop_d152ed1f-600f-4a9e-be23-44a1edc8f71a4599118900079520451.jpg' AS image_url
    UNION ALL
    SELECT 1468 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7132/insta_assets_crop_0ce16ace-d1fc-4c3f-b6e4-a8ed2c5d16d53884576868472882697.jpg' AS image_url
    UNION ALL
    SELECT 1469 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_c2410825-f38c-4afe-9467-7056e9cd64754893981831031903427.jpg' AS image_url
    UNION ALL
    SELECT 1470 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7132/insta_assets_crop_069efa64-481e-4de2-87ce-1b936a8aea782014554517391358171.jpg' AS image_url
    UNION ALL
    SELECT 1471 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_26dbacc8-9715-4a9e-8848-57daf35bdb183199618529638769624.jpg' AS image_url
    UNION ALL
    SELECT 1472 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_e56c81c6-73eb-4b18-809d-7235a7bdec872624708866640103194.jpg' AS image_url
    UNION ALL
    SELECT 1473 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6919/insta_assets_crop_9aa4d06b-fa9d-47ca-8e17-7b3147bfa5db7195470810068609205.jpg' AS image_url
    UNION ALL
    SELECT 1475 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6919/insta_assets_crop_b5adb2b1-f247-42f8-8315-abfeba14160e8612192767382420846.jpg' AS image_url
    UNION ALL
    SELECT 1476 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6919/insta_assets_crop_b61a806a-8b68-42e5-b3cd-de22e44611783272564575906593679.jpg' AS image_url
    UNION ALL
    SELECT 1477 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6919/insta_assets_crop_60da5375-afc7-4d68-9903-2101b98e90723726237325252154750.jpg' AS image_url
    UNION ALL
    SELECT 1478 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6919/insta_assets_crop_aa17bc6a-5c78-42f0-89df-eae5dd324eae289537165963119399.jpg' AS image_url
    UNION ALL
    SELECT 1479 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6919/insta_assets_crop_a5868fc2-bca8-41ce-9bfc-07b2e03ffced5413125146088221139.jpg' AS image_url
    UNION ALL
    SELECT 1480 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6919/insta_assets_crop_3860c96c-7278-4b09-adc0-2ba1daa1095b3257087617127969333.jpg' AS image_url
    UNION ALL
    SELECT 1481 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6919/insta_assets_crop_30e9911a-8c19-4534-94fa-3a268090f3354573492443688945065.jpg' AS image_url
    UNION ALL
    SELECT 1482 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6919/insta_assets_crop_5494b20e-e5ae-4071-a494-a5e3cfc356588803224476861107062.jpg' AS image_url
    UNION ALL
    SELECT 1484 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_fe07fe36-56c4-4d96-b431-0e24488c6eac1000716629046165822.jpg' AS image_url
    UNION ALL
    SELECT 1485 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7204/insta_assets_crop_4a5ce14c-e85f-498d-95dc-886f7d943d816706091800314054239.jpg' AS image_url
    UNION ALL
    SELECT 1486 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_5adbd812-02bf-4e68-b365-e7cdfeb8cac83040258286911912235.jpg' AS image_url
    UNION ALL
    SELECT 1487 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_4ad90486-3b65-46d1-b3e5-a614a117d01f87166973013045744.jpg' AS image_url
    UNION ALL
    SELECT 1488 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7242/insta_assets_crop_4b158a9c-0e6a-41b2-bc7f-7e8ad993962b5068534318485095010.jpg' AS image_url
    UNION ALL
    SELECT 1489 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7242/insta_assets_crop_e8702ce3-da46-480a-bbd6-bbc9dfc6bcee1663629852335521235.jpg' AS image_url
    UNION ALL
    SELECT 1490 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7271/insta_assets_crop_f48b0be5-0286-4e6b-bd51-96f36428512c1425291507012919951.jpg' AS image_url
    UNION ALL
    SELECT 1491 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5182/insta_assets_crop_a839e201-b6e9-4c47-87eb-e080a81975052479412874470229123.jpg' AS image_url
    UNION ALL
    SELECT 1492 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5182/insta_assets_crop_d2da2fff-e25c-48fe-9007-37646151fefb4030774212441907915.jpg' AS image_url
    UNION ALL
    SELECT 1493 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5182/insta_assets_crop_a48b2f85-a605-4dd0-8b38-69aaca546944277108857624809550.jpg' AS image_url
    UNION ALL
    SELECT 1494 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5182/insta_assets_crop_b22660d3-20ff-4b2b-82e7-24b62d4c2fc18976076520936958700.jpg' AS image_url
    UNION ALL
    SELECT 1495 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5182/insta_assets_crop_e7a5e94e-68ef-46a6-a525-7b2d3393cc8d9015594849535162446.jpg' AS image_url
    UNION ALL
    SELECT 1496 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5182/insta_assets_crop_d2da2fff-e25c-48fe-9007-37646151fefb4030774212441907915.jpg' AS image_url
    UNION ALL
    SELECT 1497 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7277/insta_assets_crop_07fc6c66-31e2-4962-b26d-def33e1f5a974922179101503666727.jpg' AS image_url
    UNION ALL
    SELECT 1498 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7236/insta_assets_crop_d4b912b1-d177-44ad-b8b4-a4f35e5d09de5882661786120940697.jpg' AS image_url
    UNION ALL
    SELECT 1499 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7236/insta_assets_crop_cd144029-58c8-430a-8d6c-f1cd0c0816da8805169463186758361.jpg' AS image_url
    UNION ALL
    SELECT 1500 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7236/insta_assets_crop_7da33dfe-dac3-4820-99d0-1657be76789f4574859927188277496.jpg' AS image_url
    UNION ALL
    SELECT 1501 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7236/insta_assets_crop_9bb8f15c-1d09-4c67-b931-852baae139b23514574380079294521.jpg' AS image_url
    UNION ALL
    SELECT 1502 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7236/insta_assets_crop_ae407b6a-921e-45b9-9b0a-455a34f7fde11396378029920484933.jpg' AS image_url
    UNION ALL
    SELECT 1503 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7236/insta_assets_crop_b2e832fc-ac46-4f11-9df2-cdac16968e238357739529825976172.jpg' AS image_url
    UNION ALL
    SELECT 1504 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_3806e486-80e9-480e-8000-38edbea45d9f7086554966238267342.jpg' AS image_url
    UNION ALL
    SELECT 1505 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_81c3f4e2-367d-4331-adf9-0b45db58e6643016390844778592305.jpg' AS image_url
    UNION ALL
    SELECT 1506 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_b2561f0e-dc2c-40ed-9065-b797ea978c9649820240940279880.jpg' AS image_url
    UNION ALL
    SELECT 1507 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_58715fc6-64b0-4490-b633-1cdafe25ebf52735776778784350142.jpg' AS image_url
    UNION ALL
    SELECT 1508 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_ce9ef160-30a4-4086-b62f-e7a1c719a1f25951612836399359395.jpg' AS image_url
    UNION ALL
    SELECT 1509 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_210878bb-c2e1-400d-83e9-12b52b9d4a9e6326828042673735174.jpg' AS image_url
    UNION ALL
    SELECT 1510 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_58de82a2-d86a-40e2-9062-959746bb32a94070774609336288652.jpg' AS image_url
    UNION ALL
    SELECT 1511 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_6c1204f7-2003-4004-892c-ff5729e1174a6735800816039390.jpg' AS image_url
    UNION ALL
    SELECT 1512 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_7ac54493-cf24-43e3-a26f-d57749cb0ee85740021169098648066.jpg' AS image_url
    UNION ALL
    SELECT 1513 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_39f54af8-f98f-4ade-8912-f845949018262446698442856615073.jpg' AS image_url
    UNION ALL
    SELECT 1514 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_1d4eefa1-077a-40d0-9819-7035a50fd137857654085277936960.jpg' AS image_url
    UNION ALL
    SELECT 1515 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_dcc7a37b-1930-4cf7-bf17-0dcd545026604769338283050629193.jpg' AS image_url
    UNION ALL
    SELECT 1516 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_980ef0df-6d12-424b-ac49-5afe0eeae5c28403336816333128119.jpg' AS image_url
    UNION ALL
    SELECT 1517 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_91dc1c44-2ca3-44cd-8e13-3d4a77527f9f771073742782702350.jpg' AS image_url
    UNION ALL
    SELECT 1518 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_c4566c80-a266-4787-b193-4f6e7de70c40155665335188065593.jpg' AS image_url
    UNION ALL
    SELECT 1519 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_e176e90d-b906-40fa-9163-be9c68aa5824359038704948239994.jpg' AS image_url
    UNION ALL
    SELECT 1520 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_5509d4d1-09d0-4912-98b5-9b5c634ef9e36418520647172610338.jpg' AS image_url
    UNION ALL
    SELECT 1521 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7279/insta_assets_crop_cf3e26d9-0bd9-4e05-a43a-407140f125044755756993596956794.jpg' AS image_url
    UNION ALL
    SELECT 1525 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5878/insta_assets_crop_e5d43b31-efac-4804-94d5-4c69fcf956e03227905342906856758.jpg' AS image_url
    UNION ALL
    SELECT 1532 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/4890/insta_assets_crop_3371ce8f-408c-40e0-828f-83bd3507cddf6749307233179768285.jpg' AS image_url
    UNION ALL
    SELECT 1533 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1612/insta_assets_crop_d51883a7-a131-4a2d-9459-1e80a3d691fb4686955455259197702.jpg' AS image_url
    UNION ALL
    SELECT 1534 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1612/insta_assets_crop_248b3470-41d1-4c00-98c3-abdb45dc57903344839605295774277.jpg' AS image_url
    UNION ALL
    SELECT 1535 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/1612/insta_assets_crop_918e8d2e-5712-4df1-b592-a22d01cba0642722666251288626723.jpg' AS image_url
    UNION ALL
    SELECT 1536 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5915/insta_assets_crop_bc0beabb-a487-4dd0-b742-ada00b6380161562885701205916149.jpg' AS image_url
    UNION ALL
    SELECT 1537 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5915/insta_assets_crop_23b8c19e-732d-41d1-9da7-03ae26e897a56398553383758122907.jpg' AS image_url
    UNION ALL
    SELECT 1538 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5915/insta_assets_crop_eec832fb-8bd2-4626-80a5-3611ec3a47664447717720363415606.jpg' AS image_url
    UNION ALL
    SELECT 1539 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5915/insta_assets_crop_f2206009-dd78-4c90-9d9c-0ddf9e1da4758741802698534567798.jpg' AS image_url
    UNION ALL
    SELECT 1540 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7281/insta_assets_crop_c31e3155-465c-4d09-b073-f57aca0f98958096987789849458068.jpg' AS image_url
    UNION ALL
    SELECT 1541 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7281/insta_assets_crop_967a099b-9e3b-4863-b943-8037c29fc2c1454270122138094968.jpg' AS image_url
    UNION ALL
    SELECT 1542 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7281/insta_assets_crop_3ca28ac2-bc2f-48c8-b47a-f432f26472068746663287028919524.jpg' AS image_url
    UNION ALL
    SELECT 1544 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7283/insta_assets_crop_4f60d1c9-2a21-4867-b84b-e32d770f219a1756723908945612042.jpg' AS image_url
    UNION ALL
    SELECT 1545 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7283/insta_assets_crop_7b3cb526-6b47-43ef-a020-9a6da21fb6ef3814688861684563951.jpg' AS image_url
    UNION ALL
    SELECT 1546 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7283/insta_assets_crop_9c03d5fb-d8ab-4ad9-842e-06c1e1b8bfab2056982467254678536.jpg' AS image_url
    UNION ALL
    SELECT 1547 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/37/image_cropper_832A9A6A-9AC7-4359-8041-F9F0EC35EE17-71371-00000BEB09AC25E4.jpg' AS image_url
    UNION ALL
    SELECT 1548 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7284/insta_assets_crop_ef6e68f4-e657-41dc-8d7f-481cf64b5dec9085145029903771258.jpg' AS image_url
    UNION ALL
    SELECT 1549 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7284/insta_assets_crop_28d841c7-3d18-4a90-8125-7b49c74497cf6661516075009444573.jpg' AS image_url
    UNION ALL
    SELECT 1550 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7284/insta_assets_crop_204cd4b5-2429-4d32-84d9-96dd2964da762513492780080258140.jpg' AS image_url
    UNION ALL
    SELECT 1551 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7284/insta_assets_crop_5203afda-e6a2-4aa8-b45e-71fc19dd1abc6902079507067788036.jpg' AS image_url
    UNION ALL
    SELECT 1552 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7285/insta_assets_crop_419cab64-33e8-4fef-ab1f-0f7d6b97b7392233688290376528228.jpg' AS image_url
    UNION ALL
    SELECT 1553 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7276/insta_assets_crop_d7946db5-ef95-4c62-bf88-c6bd1bfeaf4d6055629610654660508.jpg' AS image_url
    UNION ALL
    SELECT 1554 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7276/insta_assets_crop_dac23356-68e5-4c3b-a476-99730c95583c1786878721815553384.jpg' AS image_url
    UNION ALL
    SELECT 1558 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7276/insta_assets_crop_4b715768-bcdf-47f6-9e8f-cbfca05c9e098438745202301273066.jpg' AS image_url
    UNION ALL
    SELECT 1579 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/750/insta_assets_crop_5f61dd35-290e-4611-b0b5-4b2731f9c9ff2373337467619835306.jpg' AS image_url
    UNION ALL
    SELECT 1580 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/750/insta_assets_crop_ffcedc28-485d-4f19-9abe-acbed9a89f02607946376674247279.jpg' AS image_url
    UNION ALL
    SELECT 1582 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/750/insta_assets_crop_c4531ca3-82ff-4928-9456-cf7d073cc6064084234905901056985.jpg' AS image_url
    UNION ALL
    SELECT 1583 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/750/insta_assets_crop_a22c3012-7b3d-4215-9afa-2b1030c5fe65981052543189840597.jpg' AS image_url
    UNION ALL
    SELECT 1584 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/750/insta_assets_crop_f3d58fc6-7951-4927-84a3-532f776d32a64629573271646321772.jpg' AS image_url
    UNION ALL
    SELECT 1585 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7299/insta_assets_crop_f785240f-bcc4-4a0b-9f10-aab39c90bcc6911534650089314366.jpg' AS image_url
    UNION ALL
    SELECT 1586 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7299/insta_assets_crop_015e9424-08bd-4ac6-849f-1e329d2dea8b4891363953245321397.jpg' AS image_url
    UNION ALL
    SELECT 1587 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7302/insta_assets_crop_3a57a1b1-239d-4a08-b06b-5c944792668e3938467195591795246.jpg' AS image_url
    UNION ALL
    SELECT 1588 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7309/insta_assets_crop_deae2292-1b25-484f-ab27-5ac410eedbfe4201816043339293643.jpg' AS image_url
    UNION ALL
    SELECT 1589 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2662/insta_assets_crop_bce346d1-7043-4279-9fb0-8b618f7d0f9a3268667938730595417.jpg' AS image_url
    UNION ALL
    SELECT 1590 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2662/insta_assets_crop_7ba75549-1932-4bba-8e30-c8dcd030a3e75660933621777687563.jpg' AS image_url
    UNION ALL
    SELECT 1591 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7312/insta_assets_crop_09c4669f-9f12-4082-8717-f97f6e9262e5720167295484171435.jpg' AS image_url
    UNION ALL
    SELECT 1592 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7312/insta_assets_crop_6b70edd5-59a1-4092-ba3b-39a775ee6b2d3384347847465051212.jpg' AS image_url
    UNION ALL
    SELECT 1593 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7312/insta_assets_crop_6199b8a9-1e87-423d-90e6-2fdc05b339823220086865904592875.jpg' AS image_url
    UNION ALL
    SELECT 1595 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7312/insta_assets_crop_00e3a93d-0c18-4211-b2fa-a6028264a50e7536838397096306434.jpg' AS image_url
    UNION ALL
    SELECT 1596 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7312/insta_assets_crop_e0b773ea-e3f4-42e9-aff1-57fe0be4c2481435430426420296443.jpg' AS image_url
    UNION ALL
    SELECT 1597 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7312/insta_assets_crop_372fc543-2a0a-49e6-969b-eeff599c917a790857646274700354.jpg' AS image_url
    UNION ALL
    SELECT 1598 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7312/insta_assets_crop_8ffd227c-1dc2-4699-8aa5-72aa78ef0c582879754611038937619.jpg' AS image_url
    UNION ALL
    SELECT 1599 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7312/insta_assets_crop_64d8b7ae-1d01-4eda-b8af-fb8d15a46c821508018504350032481.jpg' AS image_url
    UNION ALL
    SELECT 1600 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7312/insta_assets_crop_aa39b3cb-7fc0-4e0e-82a1-e71df59573344361001721158778464.jpg' AS image_url
    UNION ALL
    SELECT 1601 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7312/insta_assets_crop_1e946ea4-ec9d-4ba4-9313-89626930906c458943977599939021.jpg' AS image_url
    UNION ALL
    SELECT 1603 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7312/insta_assets_crop_459416b2-3dfe-4d35-b03c-0436586863725448544634965045511.jpg' AS image_url
    UNION ALL
    SELECT 1604 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7312/insta_assets_crop_aeab705f-37f2-4853-9a8a-6174520819404472466163826953795.jpg' AS image_url
    UNION ALL
    SELECT 1605 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/7312/insta_assets_crop_8e83f73a-5112-49d6-a728-943aab1e58394376065682302063512.jpg' AS image_url
    UNION ALL
    SELECT 1606 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5776/insta_assets_crop_7d5ae658-bc55-4202-8230-b4b6fe0d74eb5279930228603760060.jpg' AS image_url
    UNION ALL
    SELECT 1607 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5776/insta_assets_crop_f8c2656e-4572-41df-9746-990e957b7b093209752824859440225.jpg' AS image_url
    UNION ALL
    SELECT 1608 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5776/insta_assets_crop_bfc4adbb-a492-4d60-b836-ed61aa7142de7246330076383286252.jpg' AS image_url
    UNION ALL
    SELECT 1609 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5776/insta_assets_crop_acd98c25-89b8-4981-b5fd-4cce035454ca8533528066056447918.jpg' AS image_url
    UNION ALL
    SELECT 1610 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/5776/insta_assets_crop_0b041ceb-013f-4b88-b6ad-91885b3f4eea3895535128370408087.jpg' AS image_url
    UNION ALL
    SELECT 1611 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2247/insta_assets_crop_b501f0df-5286-4f2a-80d5-a76fcfaebb2f7033058822726835966.jpg' AS image_url
    UNION ALL
    SELECT 1612 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2247/insta_assets_crop_18580058-e9db-45e3-b701-e5e5862df6675653540066785107523.jpg' AS image_url
    UNION ALL
    SELECT 1613 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2247/insta_assets_crop_7f432877-6155-4c73-bc7f-cc3a4bb5c1b86937351700835140756.jpg' AS image_url
    UNION ALL
    SELECT 1614 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2247/insta_assets_crop_db637797-f290-40de-93b0-d5f3cd7bb9264241096610205646991.jpg' AS image_url
    UNION ALL
    SELECT 1615 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/2247/insta_assets_crop_f23155db-24a6-4336-ace8-cf92b9f101506501966092032168250.jpg' AS image_url
    UNION ALL
    SELECT 1616 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6284/insta_assets_crop_a710f096-0477-44f0-aa6c-48a3a081e47e1261101683768851029.jpg' AS image_url
    UNION ALL
    SELECT 1617 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6284/insta_assets_crop_7c90dd81-6c2b-401b-b9ff-5d1791af3a478452940796488337381.jpg' AS image_url
    UNION ALL
    SELECT 1618 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6284/insta_assets_crop_db2c8bde-7fa3-40d6-a2b6-3930b842dc048362236135708735418.jpg' AS image_url
    UNION ALL
    SELECT 1619 AS id, 'https://solsticeprod.s3.ap-south-1.amazonaws.com/digital-profiles/6284/insta_assets_crop_99fbf9c9-11c1-413b-909d-3c1c9330a4ed382213646819493258.jpg' AS image_url
) v ON t.id = v.id
SET t.image_url = v.image_url,
    t.updated_at = NOW();