
document.addEventListener("back", () =>
{
  instance.SendMessage("BackButtonHandler", "OnBackButtonClicked")
})const hideFullScreenButton = "";
const buildUrl = "Build";
const loaderUrl = buildUrl + "/WebGL.loader.js";
const config = {
  dataUrl: buildUrl + "/WebGL.data",
  frameworkUrl: buildUrl + "/WebGL.framework.js",
  codeUrl: buildUrl + "/WebGL.wasm",
  streamingAssetsUrl: "StreamingAssets",
  companyName: "TinyBullStudios",
  productName: "lines-tamagochi",
  productVersion: "0.1.0",
};

const container = document.querySelector("#unity-container");
const canvas = document.querySelector("#unity-canvas");
const loadingCover = document.querySelector("#loading-cover");
const loadingAnimationPlayer = document.querySelector("#loading-animation-player");
const loadingLabel = document.querySelector("#loading-label");
const fullscreenButton = document.querySelector("#unity-fullscreen-button");

const canFullscreen = (function() {
  for (const key of [
      'exitFullscreen',
      'webkitExitFullscreen',
      'webkitCancelFullScreen',
      'mozCancelFullScreen',
      'msExitFullscreen',
    ]) {
    if (key in document) {
      return true;
    }
  }
  return false;
}());

if (/iPhone|iPad|iPod|Android/i.test(navigator.userAgent)) {
  container.className = "unity-mobile";
  //config.devicePixelRatio = 1;
}
loadingCover.style.display = "";

const script = document.createElement("script");
script.src = loaderUrl;
script.onload = () => {
  createUnityInstance(canvas, config, (progress) => {
    const percent = `${Math.round(100 * progress)}%`;
    loadingAnimationPlayer.seek(percent);
    loadingLabel.innerText = percent;
  }).then((unityInstance) => {
    loadingCover.style.display = "none";
    if (canFullscreen) {
      if (!hideFullScreenButton) {
        fullscreenButton.style.display = "";
      }
      fullscreenButton.onclick = () => {
        unityInstance.SetFullscreen(1);
      };
    }
  }).catch((message) => {
    alert(message);
  });
};
document.body.appendChild(script);

document.addEventListener("back", () =>
{
  instance.SendMessage("BackButtonHandler", "OnBackButtonClicked")
})
