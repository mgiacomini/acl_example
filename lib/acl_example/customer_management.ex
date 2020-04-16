defmodule AclExample.CustomerManagement do

  ## calls from customer management events

  @doc "Create a proposal from Customer Management system and send it to Salesforce"
  def create_proposal(%Proposal{} = proposal) do
    proposal
    |> save()
    |> Crm.create_proposal()

    {:ok, proposal}
  end
end
