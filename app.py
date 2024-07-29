import openai
import os
import sys
openai.api_key = "sk-proj-7p4d32i1qY9JZH8CQgndT3BlbkFJLiGlhkhM3CACu8gvboe0"
if openai.api_key is None:
    raise ValueError("OpenAI API key is not set. Please set it as an environment variable.")
sen=[]
try:
    if(len(sys.argv)<2):
        print("error")
    else:
        sen1=[]
        for i in range(1,8):
            sen1.append(sys.argv[i])
        print(sen1)
        sen=[]
        for i in range(len(sen1)):
            if(sen1[i]!='null'):
                sen.append(sen1[i])
        sentence="I am "+sen[0]+". "+"I born on "+sen[1]+". "+"My height is "+sen[2]+". "+"My weight is "+sen[3]+". "+"I am a "+sen[4]+". "+"I suffer from "+sen[5]+". "+"My goal is to "+sen[6]+". "+"what are suggestions that you can provide."
        print(sentence)
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo-1106",
            messages=[
                {"role": "system", "content": "You are a helpful assistant."},
                {"role": "user", "content": sentence}
            ]
        )
        with open("outputfile.txt", 'w') as file2:
            file2.write(response.choices[0].message['content'].strip())
except Exception as e:
    print(f"Error reading the file: {e}")


