module ProductsHelper
def form_title# valida si es nuevo producto o si es uno existente
@product.new_record? ? "Publicar Producto" : "Modificar Producto"
end

def header_style
  if @product.image.attached?
    %{ style="background-image: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ), url('#{rails_blob_url(@product.image)}'); background-size: cover; background-position: center;" }.html_safe
  else
    ""
  end
end
end