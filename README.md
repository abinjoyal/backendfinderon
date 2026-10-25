# BackendFinderOn

An AI-powered image authenticity detection backend built with Flask, PyTorch, and ResNet18. The project classifies images as real or potentially AI-generated and uses Grad-CAM to provide visual explanations of model predictions.

## Features

- **AI Image Detection:** Classifies uploaded images into supported prediction categories.
- **Deep Learning:** Uses a ResNet18-based image classification model.
- **Visual Explanations:** Uses Grad-CAM to highlight image regions relevant to the model's prediction.
- **REST API:** Provides an HTTP endpoint for image analysis.
- **Confidence Score:** Returns the model's prediction confidence.
- **Docker Support:** Includes a Dockerfile for containerized deployment.

## Tech Stack

- Python
- Flask
- PyTorch
- Torchvision
- ResNet18
- Grad-CAM
- Pillow
- Docker

## Project Structure

```text
BackendFinderOn/
├── app.py
├── model_loader.py
├── gradcam.py
├── train_model.py
├── model_weight.pth
├── requirements.txt
├── Dockerfile
├── dataset/
├── training/
└── static/
```

*Note: Adjust the folder structure above to match the actual files in your repository.*

## Installation and Setup

### 1. Clone the repository

```bash
git clone https://github.com/abinjoyal/backendfinderon.git
cd backendfinderon
```

### 2. Create a virtual environment

**Windows:**

```bash
python -m venv venv
venv\Scripts\activate
```

**Linux / macOS:**

```bash
python3 -m venv venv
source venv/bin/activate
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Run the application

```bash
python app.py
```

Check the startup message in your terminal for the server address and port.

## API Usage

### Analyze an Image

**Endpoint:** `POST /analyze`

**Content-Type:** `multipart/form-data`

**Parameter:**

| Parameter | Type | Description |
|---|---|---|
| `image` | File | Image to analyze |

### Example using cURL

```bash
curl -X POST http://127.0.0.1:5000/analyze \
  -F "image=@example.jpg"
```

Use the actual host and port configured in `app.py`.

### Expected Response Format

```json
{
  "result": "Fake",
  "confidence": 98.25,
  "explanation": "Model prediction explanation",
  "marked_image": "/outputs/marked_example.jpg"
}
```

*This is an illustrative response format. Actual fields, labels, and values depend on the implementation.*

## How It Works

1. The user uploads an image through the API.
2. The backend validates and preprocesses the image.
3. The ResNet18 model generates a prediction.
4. Grad-CAM produces a visual explanation of relevant image regions.
5. The API returns the prediction and associated information.

## Limitations

- Predictions depend on the training dataset and model quality.
- Confidence scores do not guarantee prediction correctness.
- Grad-CAM highlights influential image regions but does not prove whether an image is authentic.
- Model performance should be evaluated on independent test datasets before real-world use.
