# from flask import Flask, request, jsonify
# from transformers import BertForTokenClassification, BertTokenizerFast
# from transformers import pipeline

# import pandas as pd

# app = Flask(__name__)

# # Load tokenizer and model from local files
# model_path = "C:/Users/appuv/biolx/lib/backend/backend2"
# tokenizer_path = "C:/Users/appuv/biolx/lib/backend/backend2/tokenizer"
# tokenizer = BertTokenizerFast.from_pretrained(tokenizer_path)
# model = BertForTokenClassification.from_pretrained(model_path)

# # Define NER pipeline
# ner = pipeline("ner", model=model, tokenizer=tokenizer, aggregation_strategy='first')

# @app.route('/predict-ner', methods=['POST'])
# def predict_ner():
#     if request.method == 'POST':
#         input_text = request.json.get('input_text')
#         results = ner(input_text)
#         df_results = pd.DataFrame.from_records(results)
#         return jsonify(df_results.to_dict(orient='records'))

# if __name__ == '__main__':
#     app.run(host='192.168.47.119', port=5000)



from flask import Flask, request, jsonify
from transformers import BertForTokenClassification, BertTokenizerFast
from transformers import pipeline, AutoModelForSeq2SeqLM, AutoTokenizer
import pandas as pd

app = Flask(__name__)

# Load NER tokenizer and model from local files
ner_model_path = "C:/Users/appuv/biolx/lib/backend/backend2"
ner_tokenizer_path = "C:/Users/appuv/biolx/lib/backend/backend2/tokenizer"
ner_tokenizer = BertTokenizerFast.from_pretrained(ner_tokenizer_path)
ner_model = BertForTokenClassification.from_pretrained(ner_model_path)

# Define NER pipeline
ner = pipeline("ner", model=ner_model, tokenizer=ner_tokenizer, aggregation_strategy='first')

# Load text summarization model and tokenizer
summarization_model_path = "C:/Users/appuv/biolx/lib/backend/summarization"
summarization_tokenizer = AutoTokenizer.from_pretrained(summarization_model_path)
summarization_model = AutoModelForSeq2SeqLM.from_pretrained(summarization_model_path)

# Define summarization pipeline
summarizer = pipeline("summarization", model=summarization_model, tokenizer=summarization_tokenizer)

@app.route('/predict-ner', methods=['POST'])
def predict_ner():
    if request.method == 'POST':
        input_text = request.json.get('input_text')
        results = ner(input_text)
        df_results = pd.DataFrame.from_records(results)
        return jsonify(df_results.to_dict(orient='records'))

@app.route('/predict-summary', methods=['POST'])
def predict_summary():
    if request.method == 'POST':
        input_text = request.json.get('input_text')
        summary = summarizer(input_text, max_length=150, min_length=40, length_penalty=2.0, num_beams=4, early_stopping=True)[0]['summary_text']
        return jsonify({'summary': summary})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
