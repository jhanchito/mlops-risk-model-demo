primero crear e ambiene virtual de pyton
python3 -m venv df-env-uni
source df-env-uni/bin/activate


Luego ahora  Instalamoms las librerias
pip install -r requirements.txt

#para preparar la data
python -m src.data_prep

#para entrenar el modelo
python -m src.train
# Entrena un modelo de Logistic Regression con pipeline de scikit-learn.
# ● Registra el run en MLflow (directorio mlruns/).
# ● Guarda el modelo en: models/model-latest.pkl



# para ejuctar MLDLOW
mlflow ui --backend-store-uri mlruns

#Con DVC

#Uso de DVC para versionar datos y pipeline
dvc init

#Ejecutar el pipeline con DVC es el que llama al YAML que es el dvc-yaml para este caso
dvc repro
## Internamente crear la carpeta .dvc y dvc.lock  y versiona los datos en esa carpeta
para pushear con dvc 
#dvc remote add -d local_storage s3://mybucket/path
dvc remote add -d local_storage ./dvc-storage
# para resitrar los datos localmente pero lo ideas seria en remoto
dvc push


#De ahi levantamos el API
uvicorn api.main:app --reload
# lo podermo revisar con  http://127.0.0.1:8000/docs
#hacemos el test
python -m pytest -q


