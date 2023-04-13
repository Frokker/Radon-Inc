import requests
import base64


def code(adress):
    url_base = adress.split('/')
    # https://www.gbstore.ru
    url_base = url_base[0] + '//' + url_base[2]
    url_id = base64.urlsafe_b64encode(url_base.encode()).decode().strip("=")
    print(url_base)
    url = f"https://www.virustotal.com/api/v3/urls/{url_id}"

    headers = {
        "accept": "application/json",
        "x-apikey": "436f3c819f4456f918c14ec909e7c7808b9b94db14ace82607b624c279f037da"
    }
    try:
        response = requests.get(url, headers=headers)
        obj = response.json()['data']['attributes']['last_analysis_stats']
        print(obj)
        if response.json()['data']['attributes']['last_analysis_stats']['malicious'] > 0:
            return 'Bad'
        elif response.json()['data']['attributes']['last_analysis_stats']['suspicious'] > 0:
            return 'Suspicious'
        else:
            return 'Good'
    except:
        return 'error'
