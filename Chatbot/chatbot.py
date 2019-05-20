from chatterbot.trainers import ListTrainer
from chatterbot import ChatBot

chatbot1= ChatBot('Ejemplo',logic_adapters=[{"import_path": "chatterbot.logic.BestMatch",
            "statement_comparison_function": "chatterbot.comparisons.levenshtein_distance",
            "response_selection_method": "chatterbot.response_selection.get_first_response"},
            {'import_path': 'chatterbot.logic.LowConfidenceAdapter',
            "threshold":0.51,
            'default_response': 'Disculpa no entiendo la pregunta, puedes hacer otra?'},
            ],read_only=True)
conv=open('chat1.txt','r').readlines()
chatbot1.set_trainer(ListTrainer)
chatbot1.train(conv)
while True:
    Pregunta= input('Usuario: ')
    response=chatbot1.get_response(Pregunta)

    print('Bot: ',response)
