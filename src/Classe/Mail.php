<?php

namespace App\Classe;

use Mailjet\Client;
use Mailjet\Resources;
use phpDocumentor\Reflection\Types\This;

class Mail
{
    private string $api_key = "1e7f46bb60be94930c5a39b4df3e67f2";
    private string $api_key_secret = "8cebe01dcbffd710971dfbc4e87cb872";

    public function send($to_email, $to_name, $subject, $content): void
    {
        $mj = new Client($this->api_key, $this->api_key_secret, true, ['version' => 'v3.1']);
        $body = [
            'Messages' => [
                [
                    'From' => [
                        'Email' => "diwevit454@jontra.com",
                        'Name' => "La boutique CMR"
                    ],
                    'To' => [
                        [
                            'Email' => $to_email,
                            'Name' => $to_name
                        ]
                    ],
                    'TemplateID' => 5167865,
                    'TemplateLanguage' => true,
                    'Subject' => $subject,
                    'Variables' => ["content" => $content ]
                ]
            ]
        ];
        $response = $mj->post(Resources::$Email, ['body' => $body]);
        $response->success() && var_dump($response->getData());

    }
}