from transformers import AutoModelForSeq2SeqLM, AutoTokenizer

# Define the folder path where you stored the model files
model_folder = "C:\\Users\\appuv\\summarization"

# Load the tokenizer
tokenizer = AutoTokenizer.from_pretrained(model_folder)

# Load the model
model = AutoModelForSeq2SeqLM.from_pretrained(model_folder)

# Example text to summarize
text = """
A disease is a particular abnormal condition that adversely affects the structure or function of all or part of an organism and is not immediately due to any external injury.[1][2] Diseases are often known to be medical conditions that are associated with specific signs and symptoms. A disease may be caused by external factors such as pathogens or by internal dysfunctions. For example, internal dysfunctions of the immune system can produce a variety of different diseases, including various forms of immunodeficiency, hypersensitivity, allergies, and autoimmune disorders.

In humans, disease is often used more broadly to refer to any condition that causes pain, dysfunction, distress, social problems, or death to the person affected, or similar problems for those in contact with the person. In this broader sense, it sometimes includes injuries, disabilities, disorders, syndromes, infections, isolated symptoms, deviant behaviors, and atypical variations of structure and function, while in other contexts and for other purposes these may be considered distinguishable categories. Diseases can affect people not only physically but also mentally, as contracting and living with a disease can alter the affected person's perspective on life.

Death due to disease is called death by natural causes. There are four main types of disease: infectious diseases, deficiency diseases, hereditary diseases (including both genetic and non-genetic hereditary diseases), and physiological diseases. Diseases can also be classified in other ways, such as communicable versus non-communicable diseases. The deadliest diseases in humans are coronary artery disease (blood flow obstruction), followed by cerebrovascular disease and lower respiratory infections.[3] In developed countries, the diseases that cause the most sickness overall are neuropsychiatric conditions, such as depression and anxiety.

The study of disease is called pathology, which includes the study of etiology, or cause.
"""

# Tokenize the input text
inputs = tokenizer(text, return_tensors="pt", max_length=1024, truncation=True)

# Generate the summary
summary_ids = model.generate(inputs.input_ids, max_length=150, min_length=40, length_penalty=2.0, num_beams=4, early_stopping=True)

# Decode the summary
summary = tokenizer.decode(summary_ids[0], skip_special_tokens=True)

# Print the generated summary
print(summary)
