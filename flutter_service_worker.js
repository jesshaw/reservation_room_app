'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "44fd396cc0a4da6e4e7e82055263a4d2",
"/": "44fd396cc0a4da6e4e7e82055263a4d2",
"main.dart.js": "49bbb14c6c7a29f7200eac5600e211e0",
"assets/LICENSE": "9b3e05648284b9b63156e980812d7006",
"assets/AssetManifest.json": "82d089b6c8e5dc77099f70e60bc6c563",
"assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/assets/flutter_logo.png": "67642a0b80f3d50277c44cde8f450e50"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
