import PyPDF2

with open('nlp.pdf', 'rb') as fp:
    reader = PyPDF2.PdfReader(fp)
    page = reader.pages[0]
    text = page.extract_text()

print(text)