FROM python:3.9-slim-buster

WORKDIR /app

ENV PYTHONPATH=/app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput

CMD ["gunicorn", "todo_project.wsgi:application", "--bind", "0.0.0.0:8000"]
