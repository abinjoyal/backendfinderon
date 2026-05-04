FROM python:3.10-slim

RUN apt-get update && apt-get install -y tesseract-ocr

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .
COPY face_detector.py .
COPY fact_check.py .
COPY gradcam.py .
COPY model_loader.py .
COPY predict_news.py .
COPY model_weight.pth .
COPY static ./static

CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:$PORT"]