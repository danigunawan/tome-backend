class CharactersController < ApplicationController
    
    def getcharacters
        # byebug
        world = World.find(params['world']['id'])
        characters = world.characters
        render :json => characters
    end

    def getstorycharacters
        if params['story']
            story = Story.find(params['story']['id']) 
            characters = story.characters
            render :json => characters
        else 
            render :json => nil
        end
    end

    def create
        name = params['character']['name']
        description = params['character']['description']
        world = World.find(params['character']['world']['id'])
        newChar = Character.create(name: name, description: description, world_id: world.id)
        render :json => newChar
    end

    def update
        # byebug
        character = Character.find(params['character']['id'])
        name = params['name']
        description = params['description']
        character.update(name: name, description: description)
        character.save
        render :json => character
    end

    def destroy
        # byebug
        character = Character.find(params['character']['id'])
        character.destroy
        render :json => {
            message: 'Character Deleted'
        }        
    end


end
