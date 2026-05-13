# Processing.org Experiments

Computer vision experiments by Rafael Polo using Processing.org

## Demo Video

[![Watch on Vimeo](https://i.vimeocdn.com/video/64923776-e5585a94f259575fdfc7aa41b7b33181cf2b475894d103703284c8d07e769bff-d?mw=900&mh=506&q=70)](https://vimeo.com/11713433)

## Projects

| # | Project | Description |
|---|---------|-------------|
| 1 | [face_change](face_change) | Swaps faces of people in the scene. |
| 2 | [color_paint](color_paint) | Paints on screen by tracking selected color/pixel. |
| 3 | [gravity_ball](gravity_ball) | Ball bounces when released after being carried with closed hand. |
| 4 | [face_3d](face_3d) | 3D mask rotates following the detected face. |
| 5 | [hand_detect](hand_detect) | Captures entire scene when hand is closed. |
| 6 | [pega_luz](pega_luz) | Uses light (phone/flashlight) as brush in dark room. |
| 7 | [color_tracking](color_tracking) | Keeps two colors connected by a line. |
| 8 | [move_image](move_image) | White rabbit demonstration following hand. |
| 9 | [face_detection](face_detection) | Adds moustache to detected face. |
| 10 | [handle_contrast](handle_contrast) | Controls contrast using virtual lever. |

## How to Run

### Requirements

1. **Processing IDE** (version 2.x or 3.x recommended)
   - Download from [processing.org](https://processing.org/download)

2. **Required Libraries** (place in `libraries/` folder)
   - **OpenCV** (`hypermedia.video.*`) - for face/hand detection
   - **GLGraphics** (`processing.opengl.*`) - for 3D rendering
   - **GSVideo** (`processing.video.*`) - for video capture
   - **OBJLoader** (`saito.objloader.*`) - for 3D model loading

3. **Webcam** - Required for most projects

4. **Haar Cascade Files** - Required for detection projects
   - `haarcascade_frontalface_alt.xml`
   - `aGest.xml` (gesture detection)

### Running a Project

1. Open the project folder and run the `.pde` file in Processing IDE:
   ```bash
   processing face_change/face_change.pde
   ```

2. Or open Processing IDE and use **File > Open** to select the `.pde` file

3. Configure your webcam if prompted

### Quick Start

```bash
# Clone the repository
git clone https://github.com/rafapolo/processing.git
cd processing

# Open a specific project
processing color_paint/color_paint.pde
```

---

Rafael Polo | Copyleft 2010
