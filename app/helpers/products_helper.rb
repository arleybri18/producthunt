module ProductsHelper
    def form_title
        #valida si es nuevo producto o si es uno existente
        @product.new_record? ? "Publicar Producto" : "Modificar Producto"
    end
end