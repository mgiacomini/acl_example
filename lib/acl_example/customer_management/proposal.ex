defmodule AclExample.CustomerManagement.Proposal do
  @behaviour AclExample.Crm.Translator

  defstruct [:id, :external_id, :name]

  alias AclExample.CustomerManagement.Proposal

  alias AclExample.Crm.Lead
  alias AclExample.Crm.Opportunity

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
    %Proposal{}
  end

  def from_crm(%Opportunity{} = opportunity) do
    %Proposal{}
  end
end
