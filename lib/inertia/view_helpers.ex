defmodule Inertia.ViewHelpers do
  import Phoenix.HTML

  def inertia(page) do
    ~e(<div id="app" data-page="<%=page%>"></div>)
  end
end
