<?php

namespace App\Classes;

use GuzzleHttp\Client;

/**
 * Adaptação da biblioteca de Ivanilson Melo para nova autenticação.
 *
 * @author Equipe IFGym
 */
class SUAPClient
{
    /**
     * O token de acesso do usuário. Tokens tem 24 horas de validade.
     *
     * @var string Token de acesso.
     */
    private $access;

    /**
     * O token do usuário para a operação de refresh.
     *
     * @var string Token de refresh.
     */
    private $refresh;

    /**
     * Endpoint do SUAP.
     *
     * @var string Endpoint de acesso ao suap.
     */
    private $endpoint = 'https://suap.ifrn.edu.br/api/';

    /**
     * Um cliente GuzzleHttp para fazer os requests HTTP.
     *
     * @var GuzzleHttp\Client Cliente GuzzleHttp.
     */
    private $client;

    /**
     * Construtor. Pode ser vazio ou receber um token de acesso.
     *
     * @param string $access Token de acesso.
     */
    public function __construct($access = false, $refresh = false)
    {
        if ($access) {
            $this->setAccess($access);
        }
        if ($refresh) {
            $this->setRefresh($refresh);
        }

        // Create and use a guzzle client instance that will time out after 10 seconds
        $this->client = new Client([
            'timeout'         => 10,
            'connect_timeout' => 10,
        ]);
    }

    /**
     * Autentica o usuário e retorna um token de acesso.
     * Pode-se usar a senha ou chave de acesso do aluno.
     *
     * @param string $username  Matrícula do aluno.
     * @param string $password  Senha do aluno ou chave de acesso do responsável.
     * @param bool   $accessKey Define se o login é por chave de acesso.
     * @param bool   $setToken  Define se deve salvar o token para requests subsequentes.
     *
     * @return array $data Array contendo o token de acesso.
     */
    public function autenticar($username, $password, $accessKey = false, $setToken = true)
    {
        // Se estiver acessando com uma chave de acesso...
        if ($accessKey) {
            $url = $this->endpoint.'edu/autenticacao/acesso-responsaveis/';

            $params = [
                'matricula' => $username,
                'chave'     => $password,
            ];
        } else {
            $url = $this->endpoint.'token/pair';

            $params = [
                'username' => $username,
                'password' => $password,
            ];
        }

        $response = $this->client->request('POST', $url, [
            'json' => $params,
        ]);

        $data = false;

        if ($response->getStatusCode() == 200) {
            // Decodifica a resposta JSON para um array.
            $data = json_decode($response->getBody(), true);

            // Seta o token se solicitado. Padrão é true.
            if ($setToken && isset($data['access'])) {
                $this->setAccess($data['access']);
                $this->setRefresh($data['refresh']);
            }
        }

        return $data;
    }

    /**
     * Seta o token para acesso a API.
     *
     * @param string $access Token de acesso.
     */
    public function setAccess($access)
    {
        $this->access = $access;
    }

    /**
     * Seta o token de refresh do acesso a API.
     *
     * @param string $refresh Token de acesso.
     */
    public function setRefresh($refresh)
    {
        $this->refresh = $refresh;
    }

    /**
     * Pega os dados pessoais do aluno autenticado.
     *
     * @return array $data Dados pessoais do aluno.
     */
    public function getMeusDados()
    {
        $url = $this->endpoint.'rh/meus-dados/';

        return $this->doGetRequest($url);
    }

    /**
     * Faz um request GET para um endpoint definido.
     *
     * @param string $url Url para fazer o request.
     *
     * @return array $data Dados retornados pela API.
     */
    private function doGetRequest($url)
    {
        $response = $this->client->request('GET', $url, [
            'headers' => [
                'Authorization' => 'Bearer '.$this->access,
            ],
        ]);

        $data = false;

        if ($response->getStatusCode() == 200) {
            $data = json_decode($response->getBody(), true);
        }

        return $data;
    }
}
