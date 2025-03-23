'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "d83c959554f83df6eba889167be8e9ba",
"assets/AssetManifest.bin.json": "778f07dc0671f2722b2ed277eca3d765",
"assets/AssetManifest.json": "f1d49fc5d86aa4a48e5937842d9d1864",
"assets/assets/aadhar.png": "e698d7b866292859a00f4d5391257e59",
"assets/assets/bank.svg": "5fdfc57f038778bb38d6678af1a0e45e",
"assets/assets/banner.jpg": "ab55309c467e6e7349bfd99873c0c67d",
"assets/assets/banner1.jpg": "533be1191a17d852fe588f6bceb86607",
"assets/assets/business-svgrepo-com.svg": "f78bbff5a12221a2a917aa10e713e39d",
"assets/assets/businessman-and-dollar-coin-svgrepo-com.svg": "1e4e1195d9c54302f925d175cc65f6b1",
"assets/assets/CalculatorIcon.png": "2c953b3cd1d3233f240287df0761a580",
"assets/assets/calculatorSVG.svg": "6b94b956fc8dae8aaab51b52febf01c5",
"assets/assets/car-loan-transfer.png": "991723b07e55235ae42fcac059a149ba",
"assets/assets/car-loan.png": "90e24afeaa9e714f56077855d8d47f7a",
"assets/assets/car-refinance.png": "ef1389a9abcf695faccf809ae7f23401",
"assets/assets/card.svg": "1ac832697dd38d1a1c8fb8d78db2a053",
"assets/assets/commercialMortage.png": "1fbd1d5b3c27c863cff9b0beafa2fa23",
"assets/assets/commercialPurchase.png": "7007425b63e2ba753e43ad905a292efb",
"assets/assets/fonts/Roboto-Black.ttf": "301fe70f8f0f41c236317504ec05f820",
"assets/assets/fonts/Roboto-Bold.ttf": "9ece5b48963bbc96309220952cda38aa",
"assets/assets/fonts/Roboto-Regular.ttf": "f36638c2135b71e5a623dca52b611173",
"assets/assets/Group%2520650.svg": "b085b6b0c4f0fef46153d87553e3a19e",
"assets/assets/homescreen.jpg": "13e779e66bd826f581ca88be83453cff",
"assets/assets/homescreen2.jpg": "27bfe2f8bdf1bc0334ee57bf552ec822",
"assets/assets/intro1.jpg": "857da9120b54465a01da12a52731f3f6",
"assets/assets/intro2.jpg": "38f4a30609a9b7c910e432dbcfdfd324",
"assets/assets/intro3.jpg": "12824066cfff8892c803d703e4677833",
"assets/assets/introScreen_1.png": "eb4d9d641f187cd4e4c48f70374d323c",
"assets/assets/kb_finance_logo.png": "10ed02db225352de995f27c10ace67e6",
"assets/assets/loan_icons/affordable_emi.png": "9d9aedfe60ea06e5d4c1572c4f97af77",
"assets/assets/loan_icons/approval_reject.png": "2f3210daa98083e766a26f40d5a58770",
"assets/assets/loan_icons/balance_transfer.png": "ee2cf762f848108d2fbe1eb1208b2f51",
"assets/assets/loan_icons/blog.svg": "f0e25f7def601d442438b719680e6b66",
"assets/assets/loan_icons/business_loan.png": "0d1028505b7df2ee39d268adb5ab1f17",
"assets/assets/loan_icons/commercial_purchase.png": "e2b40d14851176585e450fc16821e1e6",
"assets/assets/loan_icons/commercial_refinance.png": "db92f3967b3866e03a6500a66da49770",
"assets/assets/loan_icons/credit_card.png": "0039510395d37983b2b5373704da9328",
"assets/assets/loan_icons/demand_loan.png": "f21b3c29d4ec9cd9f584fdb87eedb540",
"assets/assets/loan_icons/disbursed_cases.png": "7197f0917104c9a05e69124eadf9e2b5",
"assets/assets/loan_icons/education_loan.png": "bc9ef4abaad55c1b50022646ce7c4729",
"assets/assets/loan_icons/emi_calculator.png": "c5661918d5efd71ca1eb6f24f1ece843",
"assets/assets/loan_icons/factory_mortgage.png": "45cfa2d2ba9b63bc7c9d3b3c1adba01b",
"assets/assets/loan_icons/factory_purchase.png": "cc2cd59fafb0421b4f2863e77dd8638e",
"assets/assets/loan_icons/faq.svg": "e3488ec5f8a634a2e39a9a26271432f7",
"assets/assets/loan_icons/fd_calculator.png": "279d812798809cf5f392b56bc9caf98b",
"assets/assets/loan_icons/follow_up.png": "1557addcd37da582d89b66983d6e36fa",
"assets/assets/loan_icons/give_job.svg": "4e7f5d6be5b6bc1d18259a7d9a6e7e6b",
"assets/assets/loan_icons/gold_loan.png": "f4775d86321a22b0e5c4ea4eaf9b5ea0",
"assets/assets/loan_icons/loan_document.png": "9fcf85519adf28861a4ce41c17c54e49",
"assets/assets/loan_icons/login_cases.png": "22a285aa8abec1858dc3df7bab01a451",
"assets/assets/loan_icons/machinery_loan.png": "6c252a1e01f8bc0d028b91b6c36688ad",
"assets/assets/loan_icons/micro_loan.png": "7efa760d9d2832a61fffc5792fed709a",
"assets/assets/loan_icons/personal_loan.png": "7cfaec222bd4fec57af8e48cf5ce1113",
"assets/assets/loan_icons/professional_loan.png": "5924c06fe3e59a7a5d41fcf34bb581ad",
"assets/assets/loan_icons/project_loan.png": "6c252a1e01f8bc0d028b91b6c36688ad",
"assets/assets/loan_icons/read_docs.png": "5ef6249b383f7e443e2cb0d55526f4d2",
"assets/assets/loan_icons/sell_loan.png": "9f13cdee0fd4fef6cf784f4c7329440b",
"assets/assets/loan_icons/take_job.svg": "7dbabddbe164904919b217c173508300",
"assets/assets/loan_icons/tractor-refinance.png": "19150b876f84e45539bd26f5cbede8f5",
"assets/assets/loan_icons/tractor_purchase.png": "2d1b1f9e74c795dbdadfb46384eba362",
"assets/assets/logo.png": "ff35927dff548491870bf30412105466",
"assets/assets/logo4by1.png": "909d31a220aa4d21226435d6a096a3f4",
"assets/assets/mortageLoan.png": "c82d3d552e4aa8beb4deea655421a76c",
"assets/assets/new-car-loan.png": "0799aa5c48c3d8c479b02a5c04833f31",
"assets/assets/newimage.png": "4bffba6bec3f0102063fe80e27091aa4",
"assets/assets/Notification.svg": "0d7c6555b2c0b189cc34e2851e2066bb",
"assets/assets/not_available.png": "e53016f66406ad9c449586ba0623b18b",
"assets/assets/otherloan.svg": "cca2b2b6db0cebc52a79d796d44bdf00",
"assets/assets/otherloanservice.svg": "d7db5c5418b1a9b4803eb91b9a0e5049",
"assets/assets/outerimage.png": "fa2f76fbf918247b0796225dc0c209ea",
"assets/assets/pan.png": "79498979b6b9903ec127f6a470994320",
"assets/assets/productImage.jpg": "76522aa7540337bdd5235f34c900e796",
"assets/assets/productImage2.jpg": "55281cbb6155125d19c7a7a10f1a20c4",
"assets/assets/property-loan.png": "73bae88f8aebba9d66191a1234f48c83",
"assets/assets/reffer_img1.png": "d06822adaf2c7d50ee9e57fc64df5133",
"assets/assets/reffer_img2.png": "692ebd0a24d0a78a0760d26f620687f4",
"assets/assets/reffer_img3.png": "b117d907e9c0a76b0f3b1d5b7e7caf13",
"assets/assets/registerPageImage.png": "a425841a2f94bea58b9ea559460466ca",
"assets/assets/rupiloan_logo_web.png": "b9d959e3c6261eecbba06f3069a3ac4c",
"assets/assets/test_logo.png": "9dab0a247102f8e7ecdcfffa06c4ffbc",
"assets/assets/unknownUser.jpg": "26bd4bb3eee089be01e2c1c029911750",
"assets/assets/used-car-loan.png": "f13d987cbe7c8b3ba69edd3a8f4da695",
"assets/FontManifest.json": "2fda8f8f0816d324b5b66a1c1ae5c62f",
"assets/fonts/MaterialIcons-Regular.otf": "940f4683d13e8b22a17608563de5e6ef",
"assets/NOTICES": "69f4c047dc9997f820cfa6452186f26e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/flutter_image_compress_web/assets/pica.min.js": "6208ed6419908c4b04382adc8a3053a2",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/flutter_inappwebview_web/assets/web/web_support.js": "509ae636cfdd93e49b5a6eaf0f06d79f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d7791ef376c159f302b8ad90a748d2ab",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5070443340d1d8cceb516d02c3d6dee7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "658b490c9da97710b01bd0f8825fce94",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "3759b2f7a51e83c64a58cfe07b96a8ee",
"assets/packages/ready_made_calculator/fonts/Dosis-Bold.ttf": "e6ec043df8e555ed9394ab15aeb7bc00",
"assets/packages/ready_made_calculator/fonts/Dosis-Medium.ttf": "3f897d69eac9e103ccaa9ec5e7651f8b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "559d516f2c7f2ed71858c2a6973fddf3",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a3c697bec9a7f919aafa2570569e8b4d",
"/": "a3c697bec9a7f919aafa2570569e8b4d",
"main.dart.js": "ab03814e15017f93b8e4b0754ce0546a",
"manifest.json": "6222cd4069f00e8553a4577e5526b04a",
"version.json": "915fc1c557ac89be52dfe52ab7321a8f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
