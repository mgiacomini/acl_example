defmodule AclExample.CustomerManagement.Proposal do
  @behaviour AclExample.Crm.Translator

  alias AclExample.Crm.Lead

  defstruct [:id, :external_id, :name]

  def to_crm(%Proposal{} = proposal) do
    with {:has_lead?, true} <- {:has_lead?, has_lead?(proposal)},
         {:has_opportunity?, true} <- {:has_opportunity?, has_opportunity?(proposal)} do
      %Opportunity{}
    else
      {:has_opportunity?, false} ->
        # quando tem lead e não tem oportunidade, retorna um lead com id para atualizar
        %Lead{id: 1}

      {:has_lead?, false} ->
        # quando não tem nem lead, nem oportunidade, retorna um lead sem id para criar
        %Lead{}
    end
  end

  def from_crm(%Lead{} = lead) do
  end

  def from_crm(%Opportunity{} = opportunity) do
  end
end
